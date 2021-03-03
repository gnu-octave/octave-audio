## Copyright (C) 2019-2021 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{info} =} midifileinfo (@var{filename})
## Read MIDI file and display information about the tracks and data
##
## @subsubheading Inputs
## @var{filename} - filename of file to open.@*
##
## @subsubheading Outputs
## @var{info} - structure of the midi file data
## with the following fields:@*
## @table @asis
## @item filename
## the name of the file
## @item header
## The header block information
## @item track
## An array of tracks read from the file
## @item other
## An array of non-track midi blocks read from the file
## @end table
## @seealso{midifileread}
## @end deftypefn

function mi = midifileinfo(filename)

  if nargin < 1
    error ("Expected filename");
  endif

  mi = {};
  mi.filename = filename;
  mi.header = {};
  mi.track = {};
  mi.other = {};

  fd = fopen(filename, "rb");
  blockidx = 0;

  unwind_protect
    # read file
    while !feof(fd)
      blockhdr = readheader (fd);
      if !isempty (blockhdr)
        nextpos = ftell (fd) + blockhdr.blocksize;

        if strcmp (blockhdr.blocktype, "MThd")
          hdr = {};
          hdr.format = fread (fd, 1, "uint16", 0, "ieee-be");
          hdr.tracks = fread (fd, 1, "uint16", 0, "ieee-be");
          frames = fread (fd, 1, "uint8");
          ticks = fread (fd, 1, "uint8");

          if frames > 127
            hdr.tick_resolution = double(256-frames) * ticks;
          else
            hdr.ticks_per_qtr = polyval(double([frames ticks]), 256);
          endif

          hdr.ticks = ticks;
          hdr.frames = frames;

          mi.header = hdr;

        elseif strcmp (blockhdr.blocktype, "MTrk")
          cmd = 0;
          track = {};
          track.number = length (mi.track) + 1;
          track.blockindex = blockidx;
          track.blocksize = blockhdr.blocksize;
          track.blockstart = ftell(fd); 

          while ftell (fd) < nextpos
            t = getvariable(fd);

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
                ctype  = fread (fd, 1, "uint8");
                ct = getvariable (fd);
                data = fread (fd, [1 ct], "uint8");
                if ctype == 0
                  [ "seq: " char(data) ]
                elseif ctype == 1
                  track.text{end+1} = char(data);
                elseif ctype == 2
                  track.copyright = char(data);
                elseif ctype == 3
                  track.trackname = char(data);
                elseif ctype == 4
                  track.instrument = char(data);
                elseif ctype == 5
                  track.lyric{end+1} = char(data);
                elseif ctype == 6
                  #[ "marker: " char(data) ]
                elseif ctype == 7
                  #[ "cue: " char(data) ]
                else
                  #[ num2str (ctype) ": " data ]
                endif
              case {0xf1, 0xf3}
                sz = 1;
                data = fread(fd, [1 sz], "uint8");
              case {0xf2}
                sz = 2;
                data = fread(fd, [1 sz], "uint8");
              case {0xf6, 0xf7, 0xf8, 0xfa, 0xfb, 0xfc, 0xfe}
                # nothing additional to get
              case {0xf0}
                ct = getvariable (fd);
                data = fread (fd, [1 ct], "uint8");
              case { 0x80,  0x90, 0xB0, 0xE0}
                sz = 2;
                data = fread (fd, [1 sz], "uint8");
              case { 0xC0, 0xD0}
                sz = 1;
                data = fread (fd, [1 sz], "uint8");
              otherwise
                error ("unknown command now %2X", cmd);
            endswitch
          endwhile

          mi.track{end+1} = track;
        else
          track = {};
          track.blockindex = blockidx;
          track.blocksize = blockhdr.blocksize;
          track.blockstart = ftell(fd); 
          track.blocktype = blockhdr.blocktype
          mi.other{end+1} = track;
        endif

        blockidx = blockidx + 1;

        fseek (fd, nextpos, 'bof');
      endif
    endwhile
  unwind_protect_cleanup
    fclose (fd);
  end_unwind_protect

endfunction

%!shared testname
%! testname = file_in_loadpath("data/c_maj_melody.mid");

%!test
%! info = midifileinfo(testname);
%! t = info.header;
%! assert(info.header.format, 1);
%! assert(info.header.tracks, 2);
%! assert(info.header.ticks_per_qtr, 480);
%! assert(info.header.ticks, 224);
%! assert(info.header.frames, 1);
%! assert(length(info.track), 2);
%! assert(length(info.other), 0);

