## Copyright (C) 2022 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{tf} =} hasdata (@var{dev})
## Return whether there is data available to read
##
## @subsubheading Inputs
## @var{dev} - a octave midi device opened using mididevice.@*
##
## @subsubheading Outputs
## @var{tf} - true if device has data available to read@*
##
## @seealso{mididevice}
## @end deftypefn

function tf = hasdata(dev)

  if nargin < 1 || !isobject(dev) || !strcmp(typeinfo(dev), "octave_midi")
    error ("Expected midi device");
  endif

  tf = __midistat__(dev);

endfunction

