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
## @deftypefn {} {[@var{ctrlid}, @var{dev}] =} midiid ()
## Scan for control messages from midi devices to get the id of the device
## 
## Function will display a prompt for the user to move the midi control and return when
## a control messages is detected or ctrl-C is pressed.
##
## @subsubheading Inputs
## None
##
## @subsubheading Outputs
## @var{ctrlid} - control id made from the controller channel * 1000 + controller number.@*
## @var{dev} = name of the midi device the controller was detected on.
##
## @subsubheading Examples
## Monitor midi devices for first moving controller
## @example
## [ctrlid, devname] = midiid()
## @end example
##
## @seealso{mididevinfo, midicontrols}
## @end deftypefn
function [ctrlid, devname] = midiid ()
  ctrlid = 0;
  devname = "";

  # get the input devices
  devs = __mididevinfo__ ();
  idx = find (arrayfun(@(x) strcmpi(x.Direction, "input"), devs));

  devices = {};

  unwind_protect
    # open input devs
    for i = idx
      di = devs(i);
      di.device = mididevice("input", di.Name);
      devices{end+1} = di;
    endfor
  
    #  clear pending data
    for i = 1:length(devices)
      m = midireceive(devices{i}.device);
      m = midireceive(devices{i}.device);
    endfor

    printf("Move the control you wish to identify; Press Ctrl-C to abort\n");
    printf("Waiting for control message...\n");

    # poll looking for control messages
    while ctrlid == 0
      for i = 1:length(devices)
        mx = midireceive(devices{i}.device);
        for j = 1:length(mx)
          m = mx(j);
          if strcmp(m.type, "ControlChange")
            ctrlid = m.channel*1000 + double(m.msgbytes(2));
            devname = devices{i}.Name;
          endif
        endfor
      endfor
      pause (0.1)
    endwhile

  unwind_protect_cleanup
    clear devices
  end_unwind_protect

endfunction

