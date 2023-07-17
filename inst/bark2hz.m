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
## @deftypefn {} {@var{hz} =} bark2hz (@var{bark})
## Convert equivalent Bark Frequency to Hz.
##
## @subsubheading Inputs
## @var{bark} - input frequency in bark.
##
## @subsubheading Outputs
## @var{hz} - Output frequency in Hz.
##
## @subsubheading References
## Traunmüller, Hartmut. @cite{Analytical Expressions for the Tonotopic Sensory Scale.
## Journal of the Acoustical Society of America. Vol. 88, Issue 1, 1990}
##
## @seealso {hz2bark}
## @end deftypefn

function hz = bark2hz (bark)
  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(bark) && isreal(bark))
    error ("Expected real scalar or vector");
  endif

  idx1 = find(bark<2);
  idx2 = find(bark>20.1);

  bark(idx1) = (bark(idx1) - 0.3) / 0.85;
  bark(idx2) = (bark(idx2) + 4.422) / 1.22;

  hz = 1960 * (bark + 0.53) / (26.28 - bark);

endfunction

%!error bark2hz()
%!error bark2hz('a')
%!error bark2hz(2i)

%!test
%! bark = hz2bark(10);
%! hz = bark2hz(bark);
%! assert(hz, 10, 100*eps)
