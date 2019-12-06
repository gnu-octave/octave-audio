## Copyright (C) 2019 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{msg} =} midifileread (@var{filename})
## Read MIDI file into a midimsg
##
## @subsubheading Inputs
## @var{filename} - filename of file to open.@*
##
## @subsubheading Outputs
## @var{msg} - a midimsg struct containing the messages read from the file@*
## @seealso{midifileinfo, midimsg}
## @end deftypefn

function msg = midifileread(filename)

  if nargin < 1
    error ("Expected filename");
  endif

  abstime = 0;
  format = 0;
  msg = midimsg(0);

  # TODO: handle time stamp AND fact that different formats offset time stamp differently between tracks

  fd = fopen (filename, "rb");

  unwind_protect
    # read file
    while !feof (fd)
      blockhdr = readheader (fd);
      if !isempty(blockhdr)
        nextpos = ftell (fd) + blockhdr.blocksize;

        if strcmp (blockhdr.blocktype, "MThd")
          format = fread (fd, 1, "uint16", 0, "ieee-be");
          tracks = fread (fd, 1, "uint16", 0, "ieee-be");
          frames = fread (fd, 1, "uint8");
          ticks = fread (fd, 1, "uint8");

	  if frames > 127
	    frames = 255-frames;
	  else
	    ticks = uint16 (bitshift (frames, -8)) + ticks;
	    frames = 0;
	  endif
        endif
        if strcmp (blockhdr.blocktype, "MTrk")
          if format == 1
            abstime = 0;
	  endif
          cmd = 0;
	  while ftell (fd) < nextpos
	    t = getvariable(fd);
            abstime = abstime + t;

            #te = dec2hex (fread(fd,5, "uint8"))
            #fseek (fd, -5, 'cof');

            tcmd  = fread (fd,1, "uint8");
	    if tcmd >= 0x80
	      cmd = tcmd;
	    else
	      # repeat same command, so with is a data byte
	      fseek (fd,-1,'cof');
	    endif

	    if cmd >= 0xf0
	      subcmd = cmd;
            else
	      subcmd = bitand (cmd, 0xF0);
	    endif

            switch subcmd
	      case 0xff
		# example
                # ff00 1003 7741 7961 6920 0000020 206e 2061 614d 676e 7265
                ctype  = fread (fd, 1, "uint8");
                ct = getvariable (fd);
	        data = fread (fd, [1 ct], "uint8");
	        if ctype == 0
	          [ "seq: " char(data) ]
	        elseif ctype == 1
	          [ "text: " char(data) ]
	        elseif ctype == 2
	          [ "copyright: " char(data) ]
	        elseif ctype == 3
	          [ "track name: " char(data) ]
	        elseif ctype == 4
	          [ "instrument: " char(data) ]
	        elseif ctype == 5
	          [ "lyric: " char(data) ]
	        elseif ctype == 6
	          [ "marker: " char(data) ]
	        elseif ctype == 7
	          [ "cue: " char(data) ]
	        else
	          [ num2str(ctype) ": " data ]
	        endif
	      case {0xf0, 0xf7}
                ct = getvariable (fd);
	        data = fread (fd, [1 ct], "uint8");
		msg = [msg midimsg.createMessage(uint8([cmd data]), abstime)];
	      case { 0x80,  0x90, 0xB0, 0xE0}
                sz = 2;
	        data = fread (fd, [1 sz], "uint8");
		msg = [msg midimsg.createMessage(uint8([cmd data]), abstime)];
	      case { 0xC0, 0xD0}
                sz = 1;
	        data = fread(fd, [1 sz], "uint8");
		msg = [msg midimsg.createMessage(uint8([cmd data]), abstime)];
	      otherwise
	        # now what
                err = dec2hex (fread(fd,5, "uint8"));
	        error ("unknown command now %2X", cmd)
	    endswitch
          endwhile
        endif

        fseek (fd, nextpos, 'bof');
      endif
    endwhile
  unwind_protect_cleanup
    fclose (fd);
  end_unwind_protect

endfunction

