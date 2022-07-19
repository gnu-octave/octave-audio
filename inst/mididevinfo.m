## Copyright (C) 2019-2021 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{devlist} =} mididevinfo ()
## @deftypefnx {} {} mididevinfo ()
## Retrieve the midi devices detected within the system.
##
## The list will be stored with variable @var{devlist} as either a input or output device.
## If no output variable is provided, the devices will be displayed.
##
## @subsubheading Inputs
## None
##
## @subsubheading Outputs
## @var{devlist} - a structure containing the midi device information
##
## @subsubheading Examples
## Display the known devices of the system.
## @example
## @command{>} mididevinfo
##
## MIDI devices available
## ID Direction Interface  Name
##  0 output    Alsa       Midi Through:Midi Through Port-0 14:0
##  1 output    Alsa       Ensoniq AudioPCI:ES1371 16:0
##  2 output    Alsa       SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
##  3 input     Alsa       Midi Through:Midi Through Port-0 14:0
##  4 input     Alsa       Ensoniq AudioPCI:ES1371 16:0
##  5 input     Alsa       SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0 
## @end example
##
## Assign variable @var{mididevices} with the values from the known devices
## @example
## @command{>} mididevices = mididevinfo
##
## mididevices =
##  scalar structure containing the fields:
##    input =
##    @{
##      [1,1] =
##        scalar structure containing the fields:
##          Name = SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
##          Interface = Alsa
##          ID =  0
##    @}
##    output =
##    @{
##      [1,1] =
##        scalar structure containing the fields:
##          Name = SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
##          Interface = Alsa
##          ID =  1
##    @}
## @end example
##
## @seealso{mididevice}
## @end deftypefn

function out = mididevinfo ()
  # get dev list
  data = __mididevinfo__();

  # output variable to store to - so assign devices to it
  if nargout > 0
    out = {};
    out.input = {};
    out.output = {};

    for i=1:length(data)
      val = {};
      val.Name = data(i).Name;
      val.Interface = data(i).Interface;
      val.ID = data(i).ID;
      if strcmp (data(i).Direction, "input")
        out.input{end+1} = val;
      else
        out.output{end+1} = val;
      endif
    endfor
  # no output - just display the devices
  else
    printf ("MIDI devices available\n");
    printf ("ID Direction Interface  Name\n");

    for i=1:length(data)
      printf ("%2d %-9s %-10s %s\n", data(i).ID, data(i).Direction, data(i).Interface, data(i).Name);
    endfor
  endif

endfunction

%!test
%! a = mididevinfo;
%! assert(length(a) > 0);
%! x = a.input;
%! x = a.output;
