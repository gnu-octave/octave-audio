## Copyright (C) 2023 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{hz} =} mel2hz (@var{mel})
## Convert equivalent mel frequency to Hz.
##
## @subsubheading Inputs
## @var{mel} - input frequency in mel.
##
## @subsubheading Outputs
## @var{hz} - Output frequency in Hz.
##
## @subsubheading References
## O'Shaghnessy, Douglas. @cite{Speech Communication: Human and Machine. Reading, MA:
## Addison-Wesley Publishing Company, 1987}
##
## @seealso {hz2mel}
## @end deftypefn

function hz = mel2hz (mel)
  persistent A;

  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(mel) && isreal(mel))
    error ("Expected real scalar or vector");
  endif

  hz = 700 * ((10^(mel/2595)) - 1);

endfunction

%!error mel2hz()
%!error mel2hz('a')
%!error mel2hz(2i)

%!test
%! mel = hz2mel(220);
%! hz = mel2hz(mel);
%! assert(hz, 220, 100*eps)
