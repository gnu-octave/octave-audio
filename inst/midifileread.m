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

  debug = 0;

  abstime = 0;
  format = 0;
  tempo = 6e7/120;
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
	    tick_resolution = double(256-frames) * ticks;
	  else
	    ticks_per_qtr = polyval(double([frames ticks]), 256);
	  endif
        endif
        if strcmp (blockhdr.blocktype, "MTrk")
          if format == 1
            abstime = 0;
	  endif
          cmd = 0;
	  while ftell (fd) < nextpos
	    t = getvariable(fd);

	    if frames > 127
              t = t / tick_resolution;
            else
              t = t * (tempo/ticks_per_qtr)/1e6;
            endif

            abstime = abstime + t;

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
	      # TODO: convert to midi messages
	      case 0xff
		# example
                # ff00 1003 7741 7961 6920 0000020 206e 2061 614d 676e 7265
                ctype  = fread (fd, 1, "uint8");
                ct = getvariable (fd);
	        data = fread (fd, [1 ct], "uint8");
		if debug
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
                  elseif ctype == 0x21
                    [ "midiport: " sprintf("%02X ", data) ]
                  elseif ctype == 0x51
                    t = polyval(double(data), 256);
                    [ "tempo: " num2str(t) ]
                  elseif ctype == 0x54
                    [ "smtpe: " sprintf("%02X ", data) ]
                  elseif ctype == 0x58
                    [ "timesig: " sprintf("%02X ", data) ]
                  elseif ctype == 0x2f
                    [ "eot:" ]
                  elseif ctype == 0x59
                    [ "keysig: " sprintf("%02X ", data) ]
                  else
                    [ "unknown: " sprintf("%d (%02X): ", ctype, ctype) sprintf("%02X ", data)  ]
                  endif
                endif
                if ctype == 0x51
                  tempo = polyval(double(data), 256);
                endif
	      case {0xf1}
                sz = 1;
	        data = fread(fd, [1 sz], "uint8");
		msg = [msg midimsg.createMessage(uint8([cmd data]), abstime)];
	      case {0xf0, 0xf7}
                ct = getvariable (fd);
	        data = fread (fd, [1 ct], "uint8");
		msg = [msg midimsg.createMessage(uint8([cmd data]), abstime)];
	      case { 0x80,  0x90, 0xA0, 0xB0, 0xE0}
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

    # so now should have list of midi data using absolute time in secs
    # with all channels concated together
    # so sort into time order
    msg = sort(msg);
  unwind_protect_cleanup
    fclose (fd);
  end_unwind_protect

endfunction

%!shared testname
%! testname = file_in_loadpath("data/c_maj_melody.mid");

%!test
%! msg = midifileread(testname);
%! assert(length(msg), 70);
%! assert(msg(1).type == "ResetAllControllers");
%! assert(msg(1).timestamp, 0);
%! assert(msg(length(msg)).type == "NoteOn");
%! assert(msg(length(msg)).timestamp, 7.9739583, 5e-7);

