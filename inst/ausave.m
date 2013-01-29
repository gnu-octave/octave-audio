## Copyright (C) 1999 Paul Kienzle <pkienzle@users.sf.net>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## usage: ausave('filename.ext', x, fs, format)
##
## Writes an audio file with the appropriate header. The extension on
## the filename determines the layout of the header. Currently supports
## .wav and .au layouts.  Data is a matrix of audio samples in the
## range [-1,1] (inclusive), one row per time step, one column per 
## channel. Fs defaults to 8000 Hz.  Format is one of ulaw, alaw, uchar,
## short, long, float, double
##
## Note that translating the symmetric range [-1,1] into the asymmetric
## range [-2^n,2^n-1] requires a DC offset of -2/2^n.  The inverse
## process used by auload requires a DC offset of 2/2^n, so loading and
## saving a file will not change the contents.  Other applications may
## compensate for the asymmetry in a different way (including previous
## versions of auload/ausave) so you may find small differences in
## calculated DC offsets for the same file.

function ausave (filename, data, rate = 8000, sampleformat = "int16")

  if (nargin < 2 || nargin > 4)
    print_usage ();
  elseif (! ischar (filename))
    error ("ausave: FILENAME must be a string");
  elseif (! isnumeric (data) || ndims (data) != 2)
    error ("ausave: DATA must be a numeric 2D matrix");
  end

  ext = rindex (filename, '.');
  if (ext == 0)
    error ("ausave: FILENAME `%s' has no extension", filename);
  end
  ext = tolower (substr (filename, ext+1, length (filename) -ext));

  # determine data size and orientation
  [samples, channels] = size (data);
  if (samples < channels)
    data = data.';
    [samples, channels] = size (data);
  endif

  ## FIXME: should we give an error instead on input check?
  ## Make sure the data fits into the sample range
  scale = max (abs (data(:)));
  if (scale > 1)
    warning ("ausave: DATA exceeds range [-1,1] --- rescaling");
    data = data / scale;
  endif

  ## Microsoft .wav format
  if (strcmp (ext,'wav'))

    ## Header format obtained from sox/wav.c
    ## April 15, 1992
    ## Copyright 1992 Rick Richardson
    ## Copyright 1991 Lance Norskog And Sundry Contributors
    ## This source code is freely redistributable and may be used for
    ## any purpose.  This copyright notice must be maintained. 
    ## Lance Norskog And Sundry Contributors are not responsible for 
    ## the consequences of using this software.

    switch (sampleformat)
      case "uchar",   formatid = 1; samplesize = 1;
      case "short",   formatid = 1; samplesize = 2;
      case "long",    formatid = 1; samplesize = 4;
      case "float",   formatid = 3; samplesize = 4;
      case "double",  formatid = 3; samplesize = 8;
      case "alaw",    formatid = 6; samplesize = 1;
      case "ulaw",    formatid = 7; samplesize = 1;
      otherwise,      error ("ausave: SAMPLEFORMAT `%s' is invalid for .wav file", sampleformat);
    end

    datasize = channels*samplesize*samples;

    [file, msg] = fopen (filename, 'wb');
    if (file == -1)
      error ("ausave: unable to fopen `%s' for writing: %s", filename, msg);
    end

    ## write the magic header
    arch = 'ieee-le';
    fwrite(file, toascii('RIFF'), 'int8');
    fwrite(file, datasize+36, 'int32', 0, arch);
    fwrite(file, toascii('WAVE'), 'int8');

    ## write the "fmt " section
    fwrite(file, toascii('fmt '), 'int8');
    fwrite(file, 16, 'int32', 0, arch);
    fwrite(file, formatid, 'int16', 0, arch);
    fwrite(file, channels, 'int16', 0, arch);
    fwrite(file, rate, 'int32', 0, arch);
    fwrite(file, rate*channels*samplesize, 'int32', 0, arch);
    fwrite(file, channels*samplesize, 'int16', 0, arch);
    fwrite(file, samplesize*8, 'int16', 0, arch);

    ## write the "data" section
    fwrite(file, toascii('data'), 'int8');
    fwrite(file, datasize, 'int32', 0, arch);

  ## Sun .au format
  elseif (strcmp (ext, 'au'))

    ## Header format obtained from sox/au.c
    ## September 25, 1991
    ## Copyright 1991 Guido van Rossum And Sundry Contributors
    ## This source code is freely redistributable and may be used for
    ## any purpose.  This copyright notice must be maintained. 
    ## Guido van Rossum And Sundry Contributors are not responsible for 
    ## the consequences of using this software.

    switch (sampleformat)
      case "ulaw",    formatid = 1; samplesize = 1;
      case "uchar",   formatid = 2; samplesize = 1;
      case "short",   formatid = 3; samplesize = 2;
      case "long",    formatid = 5; samplesize = 4;
      case "float",   formatid = 6; samplesize = 4;
      case "double",  formatid = 7; samplesize = 8;
      otherwise,      error ("ausave: SAMPLEFORMAT `%s' is invalid for .au file", sampleformat);
    end

    datasize = channels*samplesize*samples;

    [file, msg] = fopen (filename, 'wb');
    if (file == -1)
      error ("ausave: unable to fopen `%s' for writing: %s", filename, msg);
    end

    arch = 'ieee-be';
    fwrite(file, toascii('.snd'), 'int8');
    fwrite(file, 24, 'int32', 0, arch);
    fwrite(file, datasize, 'int32', 0, arch);
    fwrite(file, formatid, 'int32', 0, arch);
    fwrite(file, rate, 'int32', 0, arch);
    fwrite(file, channels, 'int32', 0, arch);

  ## Apple/SGI .aiff format
  elseif (any (strcmp (ext, {"aiff", "aif"})))

    ## Header format obtained from sox/aiff.c
    ## September 25, 1991
    ## Copyright 1991 Guido van Rossum And Sundry Contributors
    ## This source code is freely redistributable and may be used for
    ## any purpose.  This copyright notice must be maintained. 
    ## Guido van Rossum And Sundry Contributors are not responsible for 
    ## the consequences of using this software.
    ##
    ## IEEE 80-bit float I/O taken from
    ##        ftp://ftp.mathworks.com/pub/contrib/signal/osprey.tar
    ##        David K. Mellinger
    ##        dave@mbari.org
    ##        +1-831-775-1805
    ##        fax       -1620
    ##        Monterey Bay Aquarium Research Institute
    ##        7700 Sandholdt Road

    switch (sampleformat)
      case "uchar", samplesize = 1;
      case "short", samplesize = 2;
      case "long",  samplesize = 4;
      otherwise,    error ("ausave: SAMPLEFORMAT `%s' is invalid for .aiff file", sampleformat);
    end
    datasize = channels*samplesize*samples;

    [file, msg] = fopen (filename, 'wb');
    if (file == -1)
      error ("ausave: unable to fopen `%s' for writing: %s", filename, msg);
    end

    ## write the magic header
    arch = 'ieee-be';
    fwrite(file, toascii('FORM'), 'int8');
    fwrite(file, datasize+46, 'int32', 0, arch);
    fwrite(file, toascii('AIFF'), 'int8');

    ## write the "COMM" section
    fwrite(file, toascii('COMM'), 'int8');
    fwrite(file, 18, 'int32', 0, arch);
    fwrite(file, channels, 'int16', 0, arch);
    fwrite(file, samples, 'int32', 0, arch);
    fwrite(file, 8*samplesize, 'int16', 0, arch);
    fwrite(file, 16414, 'uint16', 0, arch);         % sample rate exponent
    fwrite(file, [rate, 0], 'uint32', 0, arch);       % sample rate mantissa

    ## write the "SSND" section
    fwrite(file, toascii('SSND'), 'int8');
    fwrite(file, datasize+8, 'int32', 0, arch); # section length
    fwrite(file, 0, 'int32', 0, arch); # block size
    fwrite(file, 0, 'int32', 0, arch); # offset

  ## file extension unknown
  else
    error ("ausave: unsupported extension `%s' in FILENAME `%s'", ext, filename);
  end

  ## convert samples from range [-1, 1]
  switch (sampleformat)
    case "alaw"   precision = "uint8"; error("FIXME: ausave needs linear to alaw conversion\n");
    case "ulaw"   precision = "uint8"; data = lin2mu (data, 0);
    case "uchar"  precision = "uint8"; data = round ((data+1)*127.5);
    case "short"  precision = "in16";  data = round (data*32767.5 - 0.5);
    case "long"   precision = "int32"; data = round (data*(2^31-0.5) - 0.5);
    otherwise,    precision = sampleformat;
  endswitch

  fwrite (file, data', precision, 0, arch);
  fclose (file);

endfunction
