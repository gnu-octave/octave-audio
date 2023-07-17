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
## @deftypefn {} {@var{mel} =} hz2mel (@var{hz})
## Convert hz to equivalent mel frequency.
##
## @subsubheading Inputs
## @var{hz} - input frequency in Hz.
##
## @subsubheading Outputs
## @var{mel} - Output frequency as a mel value
##
## @subsubheading Examples
## Convert 4000 Hz to mel
## @example
## @code{mel = hz2mel(4000)}
## @end example
##
## Convert a range of Hz to mel
## @example
## @code {mel = hz2erb(4000:100:5000)}
## @end example
##
## @subsubheading References
## O'Shaghnessy, Douglas. @cite{Speech Communication: Human and Machine. Reading, MA:
## Addison-Wesley Publishing Company, 1987}
##
## @seealso {mel2hz}
## @end deftypefn

function mel = hz2mel (hz)
  if nargin < 1
    show_usage()
  endif

  if ! (isnumeric(hz) && isreal(hz))
    error ("Expected real scalar or vector");
  endif

  mel = 2595 * log10 (1 + hz/700);
endfunction

%!error hz2mel()
%!error hz2mel('a')
%!error hz2mel(2i)

%!assert(hz2mel(440), 549.6387, 10^-4)

