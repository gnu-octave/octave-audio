## Copyright (C) 2020 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {} makevariable (@var{value})
## Private function
## @end deftypefn


function data = makevariable (value)
  t = uint64(value);
  if t < 128
    v = uint8(t);
    data = [v];
  else
    tmp = dec2bin(t);
    while mod(length(tmp), 7) != 0
      tmp = [ "0" tmp ];
    endwhile
    data = [];
    for i=1:7:length(tmp)
      v = tmp(i:i+6);
      v = uint8(bin2dec(v));
      if i < length(tmp) -7
        v = 128 + v;
      endif

      data = [data v];
    endfor
  endif
endfunction
