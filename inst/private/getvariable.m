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
## @deftypefn {} {@var{t} =} getvariable (@var{fd})
## Private function
## @end deftypefn

function t = getvariable (fd)
  t = uint64(0);
  while !feof(fd)
    b = fread(fd, 1, "uint8");
    t = bitshift(t, 7) + bitand(b, uint64(0x7f));
    if b < 128
      break;
    endif
  endwhile
  t = double(t);
endfunction
