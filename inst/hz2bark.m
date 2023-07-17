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
## @deftypefn {} {@var{bark} =} hz2bark (@var{hz})
## Convert hz to equivalent bark frequency
##
## @subsubheading Inputs
## @var{hz} - input frequency in Hz.
##
## @subsubheading Outputs
## @var{bark} - Output frequency as a bark value
##
## @subsubheading Examples
## Convert 4000 Hz to erb
## @example
## @code{erb = hz2erb(4000)}
## @end example
##
## @subsubheading References
## Traunmüller, Hartmut. @cite{Analytical Expressions for the Tonotopic Sensory Scale.
## Journal of the Acoustical Society of America. Vol. 88, Issue 1, 1990}
##
## @seealso {bark2hz}
## @end deftypefn
function bark = hz2bark(hz)
  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(hz) && isreal(hz))
    error ("Expected real scalar or vector");
  endif

  bark = ((26.81 * hz) / (1960 + hz)) - 0.53;

  idx1 = find(bark<2);
  idx2 = find(bark>20.1);

  bark(idx1) = bark(idx1) + 0.15 * (2 - bark(idx1));

  bark(idx2) = bark(idx2) + 0.22 * (bark(idx2) - 20.1);

endfunction

%!error hz2bark()
%!error hz2bark('a')
%!error hz2bark(2i)

%!assert(hz2bark(100), 0.9557, 10^-4)
