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
## @deftypefn {} {@var{midimsg} =} midireceive (@var{dev})
## @deftypefnx {} {@var{midimsg} =} midireceive (@var{dev}, @var{maxmsg})
## Attempt to receive midi messages from a midi device.
##
## @subsubheading Inputs
## @var{dev} - a octave midi device opened using mididevice.@*
## @var{maxmsg} - Maximum number of messages to retrieve. If not specified, the function will attempt to get all pending.@*
##
## @subsubheading Outputs
## @var{midimsg} - a midimsg containing the messages retrieved from the device.@*
## If no messages are available, @var{midimsg} will be empty.
##
## @subsubheading Examples
## Open device 0, and poll and display read messages
## @example
## dev = mididevice(0);
## while true
##    mx = midireceive(dev);
##    if !isempty(mx)
##      % display message
##      mx
##    endif
## endwhile
## @end example
##
## @seealso{mididevice, midisend}
## @end deftypefn

function msg = midireceive (dev, maxmsg=0)
  if nargin < 1 || !isobject(dev) || !strcmp(typeinfo(dev), "octave_midi")
    error ("Expected midi device");
  endif

  if nargin < 2
    maxmsg = 0;
  endif

  msg = midimsg (0);
  [ts, data] = __midirecv__(dev);
  while !isempty(data)
    msg = [ msg midimsg.createMessage(data, ts) ];

    if maxmsg > 0
      maxmsg = maxmsg - 1;
      if maxmsg == 0
        break;
      endif
    endif
    [ts, data] = __midirecv__(dev);
  endwhile

endfunction
