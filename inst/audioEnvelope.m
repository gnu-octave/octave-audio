## Copyright (C) 2026 John Donoghue <john.donoghue@ieee.org>
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {[@var{minenv} ,@var{maxenv}, @var{loc}, @var{fs}] =} audioEnvelope(audiodata)
## @deftypefnx {} {[@var{minenv} ,@var{maxenv}, @var{loc}, @var{fs}] =} audioEnvelope(filename)
## @deftypefnx {} {[@var{minenv} ,@var{maxenv}, @var{loc}, @var{fs}] =} audioEnvelope(___, @var{propname}, @var{propvalue} @dots{})
## @deftypefnx {} {} audioEnvelope(___)
## calculate envelope information for a audio signal.
##
## @subsubheading Inputs
## @var{audiodata} - input data, as a matrix or column vector where each column is a channel.
##
## @var{filename} - input audio file to read.
##
### @var{propname}, @var{propvalue} - property name/value pairs.
##
## Known properties are:
## @table @asis
## @item NumPoints
## Number of points that make up each envelop (default 1000)
## @item SampleRate
## Samplerate of the input data. When a filename is specified, sample
## rate is taken from the file.
## @item Range
## A 2 element vector for the start,end range of input signal to be used.
## @end table
##
## @subsubheading Outputs
## @var{minenv} - minimum values of the envelope as a NumPoints-by-C matrix, where C is the number of channels in the input signal.
##
## @var{maxenv} - maximum values of the envelope as a NumPoints-by-C matrix, where C is the number of channels in the input signal.
##
## @var{loc} - Index into the audioodata for each frame.
##
## @var{fs} - Sample rate. If the input is audiodata, and no sample rate option was provided, fs will be 1.
##
## @seealso {audioread, plot}
## @end deftypefn

function [minenv, maxenv, loc, fs] = audioEnvelope (source, varargin)

  if nargin < 1
    show_usage() 
  endif

  minin = 1;
  maxin = -1;
  fs = -1;

  # properties to process
  if mod(length(varargin), 2) != 0
    error ("Expected property name/value pairs.")
  endif

  p = inputParser(CaseSensitive=false, FunctionName='audioEnvelope');
  chk = @(x) isscalar (x) && isreal(x) && (x >= 1);
  p.addParameter('NumPoints', 1000, chk);
  chk = @(x) isvector (x) && isreal(x) && all(x >= 1) && length(x) == 2;
  p.addParameter('Range', [], chk);
  chk = @(x) isscalar (x) && isreal(x) && (x > 0);
  p.addParameter('SampleRate', -1, chk);
  p.parse(varargin{:})

  minin = 1;
  maxin = -1;

  fs = p.Results.SampleRate;
  if !isempty(p.Results.Range)
    minin = p.Results.Range(1);
    maxin = p.Results.Range(2);
    # check maxin > minin
    if maxin <= minin,
      error ("Range should be [start,end] range.");
    endif
  endif

  # read or grab requested data
  if ischar(source)
    ainfo = audioinfo(source);
    fs = ainfo.SampleRate;
    if maxin == -1
      maxin = ainfo.TotalSamples;
    endif
    data = audioread(source, [minin, maxin]);
  else
    if (! isnumeric (source) || isempty (source))
      error ("audiodata must be a nonempty numeric matrix");
    endif

   # Ensure column-oriented samples
    if (isvector (source))
      source = source(:);
    endif

    if maxin == -1
      data = source;
    else
      data = source([minin:maxin], :);
    endif
  endif

  if nargout > 0
    # calculate the env
    [L, C] = size (data);
    numpoints = min(floor(p.Results.NumPoints), L);

    framesize = floor (L / numpoints);

    minenv = zeros (numpoints, C, class (data));
    maxenv = zeros (numpoints, C, class (data));
    loc = zeros (1, numpoints);

    for k = 1:numpoints

      idx1 = (k - 1) * framesize + 1;

      if (k < numpoints)
        idx2 = k * framesize;
      else
        ## Include any leftover samples in the last frame
        idx2 = L;
      endif

      frame = data(idx1:idx2, :);

      minenv(k, :) = min (frame, [], 1);
      maxenv(k, :) = max (frame, [], 1);

      loc(k) = idx2;

    endfor

    if fs == -1
      fs = 1;
    endif
  endif

  if nargout == 0
    # show plot
    if fs > 0
      t = (0:1/fs:(size(data,1)-1)/fs);
      plot(t, data);
      xlabel('Seconds');
    else
      xlabel('Samples');
      plot(data);
    endif
    ylabel('Envelope');
  endif
endfunction

%!error audioEnvelope()

%!test
%! filename = file_in_loadpath("data/sample.wav");
%! [minenv, maxenv, loc, fs] = audioEnvelope(filename);
%! assert(size(minenv), [1000 1]);
%! assert(size(maxenv), [1000 1])
%! assert(size(loc), [1 1000])
%! assert(fs, 22050)

%!test
%! t = 0:.01:2*pi*10;
%! data = sin(t)';
%! [minenv, maxenv, loc, fs] = audioEnvelope(data, 'NumPoints', 500);
%! assert(size(minenv), [500 1]);
%! assert(size(maxenv), [500 1])
%! assert(size(loc), [1 500])
%! assert(fs, 1)
%! [minenv, maxenv, loc, fs] = audioEnvelope(data, 'NumPoints', 500, 'SampleRate', 100);
%! assert(size(minenv), [500 1]);
%! assert(size(maxenv), [500 1])
%! assert(size(loc), [1 500])
%! assert(fs, 100)
%! [minenv, maxenv, loc, fs] = audioEnvelope(data, 'Range', [1 100], 'SampleRate', 1000);
%! assert(size(minenv), [100 1]);
%! assert(size(maxenv), [100 1])
%! assert(size(loc), [1 100])
%! assert(fs, 1000)
