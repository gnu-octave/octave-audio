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
## @deftypefn {} {@var{erb} =} hz2erb (@var{hz})
## Convert hz to equivalent rectangular bandwidth (ERB)
##
## @subsubheading Inputs
## @var{hz} - input frequency in Hz.
##
## @subsubheading Outputs
## @var{erb} - Output frequency as a erb value
##
## @subsubheading Examples
## Convert 4000 Hz to erb
## @example
## @code{erb = hz2erb(4000)}
## @end example
##
## Convert a range of Hz to erb
## @example
## @code {erb = hz2erb(4000:100:5000)}
## @end example
##
## @subsubheading References
## Glasberg and Moore. @cite{Derivation of Auditory Filter Shapes from Notched-Noise Data.
## Hearing Research. Vol. 47, 1990}
##
## @seealso {erb2hz}
## @end deftypefn
function erb = hz2erb(hz)
  persistent A;

  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(hz) && isreal(hz))
    error ("Expected real scalar or vector");
  endif

  if isempty (A)
    A = 1000 * log(10.0) / (24.7*4.37);
  endif

  erb = A * log10 (1 + hz * 0.00437);
endfunction

%!error hz2erb()
%!error hz2erb('a')
%!error hz2erb(2i)

%!assert(hz2erb(5500), 29.8342, 10^-4)

%!test
%! erb = hz2erb(10);
%! hz = erb2hz(erb);
%! assert(hz, 10, 100*eps)
