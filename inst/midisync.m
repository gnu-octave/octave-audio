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
## @deftypefn {} {} midisync (@var{midicontrolsObj})
## @deftypefnx {} {} midisync (@var{midicontrolsObj}, @var{ctrlvalues})
## Send the values of control object to the control, using @var{ctrlvalues} values
## if specified instead
## 
## @subsubheading Inputs
## @var{midicontrolObj} - control object created using midicontrols@*
## @var{ctrlvalues} - values to send to the controls instead of initial values
##
## @subsubheading Outputs
## None
##
## @subsubheading Examples
## Send sync command to a midicontrols with a ctrlid 2001 to set a value of 1
## @example
## ctrl = midicontrols(2001)
## midisync(ctrl, 1);
## @end example
##
## @seealso{midicontrols}
## @end deftypefn
function midisync (ctrlobj, values)
  if nargin < 1 || !isa (ctrlobj, "midicontrols")
    error ("Expected midi controls object");
  endif

  if nargin < 2
    ctrlobj.send()
  else
    ctrlobj.send(values)
  endif

endfunction

