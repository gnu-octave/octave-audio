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
## @deftypefn {} {@var{ismidi} =} ismidifile (@var{filename})
## Check if @var{filename} is a midi file.
##
## The function only checks whether it is an existing file and the
## file starts with a valid 'MThd' header.
##
## Non existing files, or files that do not meet the header criteria will return false.
##
## @subsubheading Inputs
## @var{filename} - filename of file to check.@*
##
## @subsubheading Outputs
## @var{ismidi} - true if it is a midi file, false otherwise
##
## @seealso{midifileread, midifilewrite}
## @end deftypefn

function ismidi = ismidifile(filename)

  ismidi = false;

  if nargin < 1
    error ("Expected filename");
  endif

  fd = -1;
  try
    fd = fopen (filename, "rb");
    unwind_protect
      blockhdr = readheader (fd);
      if !isempty(blockhdr)
        if strcmp (blockhdr.blocktype, "MThd")
          ismidi = true;
        endif
      endif
    unwind_protect_cleanup
      fclose (fd);
    end_unwind_protect
  catch
    # do nothing
  end_try_catch

endfunction

%!test
%! testname = file_in_loadpath("data/c_maj_melody.mid");
%! assert (ismidifile(testname), true);

%!test
%! testname = file_in_loadpath("data/sample.wav");
%! assert (ismidifile(testname), false);

%!test
%! testname = "X_DOES_NOT_EXIST_X";
%! assert (ismidifile(testname), false);
