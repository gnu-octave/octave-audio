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
## @deftypefn {} {@var{hz} =} erb2hz (@var{erb})
## Convert equivalent rectangular bandwidth (ERB) to Hz.
##
## @subsubheading Inputs
## @var{erb} - input frequency in erb.
##
## @subsubheading Outputs
## @var{hz} - Output frequency in Hz.
##
## @subsubheading References
## Glasberg and Moore. @cite{Derivation of Auditory Filter Shapes from Notched-Noise Data.
## Hearing Research. Vol. 47, 1990}
##
## @seealso {hz2erb}
## @end deftypefn

function hz = erb2hz (erb)
  persistent A;

  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(erb) && isreal(erb))
    error ("Expected real scalar or vector");
  endif

  if isempty (A)
    A = 1000 * log(10.0) / (24.7*4.37);
  endif

  hz = (10^(erb/A) - 1) / 0.00437;

endfunction

%!error erb2hz()
%!error erb2hz('a')
%!error erb2hz(2i)

%!test
%! erb = hz2erb(10);
%! hz = erb2hz(erb);
%! assert(hz, 10, 100*eps)
