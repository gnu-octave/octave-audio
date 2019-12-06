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
## @deftypefn {} {} midifilewrite (@var{filename}, @var{msgs})
## Write a midifile
##
## @subsubheading Inputs
## @var{filename} - filename of file to open.@*
## @var{msg} - a midimsg struct containing data to write to file@*
##
## @subsubheading Outputs
## None
## @seealso{midifileread, midimsg}
## @end deftypefn

function msg = midifilewrite(filename, msg)

  if nargin < 2
    error ("Expected filename and messages");
  endif

  if !isa(msg, "midimsg")
    error ("Expected midimsg type messages");
  endif

  fd = fopen (filename, "wb");

  unwind_protect
    # block hdr
    hdr = {};
    hdr.blocksize = 6;
    hdr.blocktype = "MThd";
    writeheader (fd, hdr);
    # info
    format = 0;
    tracks = 1;
    frames = 0;
    ticks = 120;
    fwrite (fd, format, "uint16", 0, "ieee-be");
    fwrite (fd, tracks, "uint16", 0, "ieee-be");
    fwrite (fd, frames, "uint8");
    fwrite (fd, ticks, "uint8");

    # the tracks
    fixpos = ftell (fd);
    hdr.blocksize = 0;
    hdr.blocktype = "MTrk";
    writeheader (fd, hdr);

    for i=1:length(msg)
      a = msg(i);
      setvariable (fd, a.timestamp);
      fwrite (fd, a.msgbytes);
    endfor

    # fix the size of the track
    cpos = ftell (fd);
    len = cpos - fixpos - 8;
    fseek (fd, fixpos, SEEK_SET);

    hdr.blocksize = len;
    hdr.blocktype = "MTrk";
    writeheader (fd, hdr);

    fseek (fd, cpos, SEEK_SET);
    
  unwind_protect_cleanup
    fclose (fd);
  end_unwind_protect

endfunction

%!shared testname
%! testname = tempname;

%!test
%! data = midimsg("note", 1, 60, 100, 2);
%! midifilewrite(testname, data);
%! msg = midifileread(testname);
%! assert(msg(1).msgbytes, uint8([0x90 0x3C 0x64]));
%! assert(msg(2).msgbytes, uint8([0x90 0x3C 0x00]));
%! assert(msg(2).timestamp, 2);

%!test
%! if exist (testname, 'file');
%!   delete (testname);
%! end
