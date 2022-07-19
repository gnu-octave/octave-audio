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
## @deftypefn {} {} midisend (@var{dev}, @var{msg})
## @deftypefnx {} {} midisend (@var{dev}, ...)
## Send a midimsg to a midi device
##
## @subsubheading Inputs
## @var{dev} - midi device opened using mididevice@*
## @var{msg} - a midi message class with messages to send to the midi device@*
## If the msg isn't a midimsg class, the input data is expected to be in same format as the inputs to a midimsg object.
##
## @subsubheading Outputs
## None
##
## @subsubheading Examples
## Send a note on/off command to a opened midi device @var{dev}
## @example
## midisend(dev, midimsg("note", 1, 60, 100, 2.0));
## @end example
## 
## @seealso{midimsg, mididevice, midireceive}
## @end deftypefn

function midisend (dev, varargin)
  if nargin < 2
     error ("Expected midi device and midi message");
  endif
  if !isobject(dev) || !strcmp(typeinfo(dev), "octave_midi")
    error ("Expected midi device");
  endif

  msg = varargin{1};

  # NOTE: can be an array or cell of messages too
  if isa (msg, "midimsg")
    if nargin > 2
      error ("additional parameters provided after the message");
    endif
  else
    # have data to make a message
    msg = midimsg(varargin{2:end});
  endif

  msg_data = msg.msgbytes;
  msg_ts = msg.timestamp;

  if !iscell(msg_ts)
    msg_data = { msg_data };
    msg_ts = { msg_ts };
  endif

  # TODO: determine if is 'recent' or not for what timestamp to use
  # currently, we 'assume' that the 1st midi msg must go NOW
  if length(msg_ts) > 0
    timestamp = msg_ts{1};
  else
    timestamp = 0;
  endif

  # loop thru data and send each message
  for i=1:length(msg_ts)
     ts = msg_ts{i};

     if ts < timestamp
       ts = timestamp - ts;
     endif

     delta = (ts - timestamp);
     if delta < 0
       delta = 0;
     endif

     pause(delta);

     data = msg_data{i};

     # if we have metaevents, dont send them length would be FF type encodedsize data
     if length(data) < 3 || data(1) != 0xff
       __midisend__(dev, ts, data);
     endif

     timestamp = timestamp + delta;
  endfor

endfunction
