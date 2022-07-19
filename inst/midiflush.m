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
## @deftypefn {} {} midiflush (@var{dev})
## Flush the receive buffers on a midi device
##
## @subsubheading Inputs
## @var{dev} - midi device opened using mididevice@*
##
## @subsubheading Outputs
## None
##
## @subsubheading Examples
## Flush a midi device
## @example
## midiflush(dev);
## @end example
## 
## @seealso{mididevice, midireceive}
## @end deftypefn

function midiflush (dev)
  if nargin != 1
     error ("Expected midi device");
  endif
  if !isobject(dev) || !strcmp(typeinfo(dev), "octave_midi")
    error ("Expected midi device");
  endif

  __midiflush__(dev);

endfunction

%!test
%! a = mididevice(0);
%! assert(isa(a, "octave_midi"));
%! midiflush(a);

%!error <Expected midi device> midiflush(0)

