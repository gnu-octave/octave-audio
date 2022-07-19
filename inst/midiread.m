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
## @deftypefn {} {@var{val} =} midiread (@var{midicontrolsObj})
## Read current values of midi controls
## 
## @subsubheading Inputs
## @var{midicontrolObj} - control object created using midicontrols@*
##
## @subsubheading Outputs
## @var{val} single value or array of current values from the midi device.
##
## @subsubheading Examples
## Read current value of midicontrols with a ctrlid 2001 on the default midi device.
## @example
## ctrl = midicontrols(2001)
## val = midiread(ctrl);
## @end example
##
## Read current value of midicontrols with a ctrlid 2001 on a non default midi device.
## @example
## ctrl = midicontrols(2001, 'mididevice', 1)
## val = midiread(ctrl);
## @end example
##
## @seealso{midicontrols, midisync}
## @end deftypefn
function ret = midiread (ctrlobj)
  if nargin < 1 || !isa (ctrlobj, "midicontrols")
    error ("Expected midi controls object");
  endif

  ret =   ctrlobj.recv();

endfunction

