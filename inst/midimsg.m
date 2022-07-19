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

classdef midimsg
  ## -*- texinfo -*- 
  ## @deftypefn {} {@var{msg} =} midimsg (0)
  ## @deftypefnx {} {@var{msg} =} midimsg (@var{type} ....)
  ## @deftypefnx {} {@var{msg} =} midimsg ("note", @var{channel}, @var{note}, @var{velocity}, @var{duration}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("noteon", @var{channel}, @var{note}, @var{velocity}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("noteoff", @var{channel}, @var{note}, @var{velocity}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("programchange", @var{channel}, @var{prog}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("controlchange", @var{channel}, @var{ccnum}, @var{ccval}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("polykeypressure", @var{channel}, @var{note}, @var{keypressure}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("channelpressure", @var{channel}, @var{chanpressure}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("localcontrol", @var{channel}, @var{localcontrol}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("pitchbend", @var{channel}, @var{pitchchange}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("polyon", @var{channel}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("monoon", @var{channel}, @var{monochannels}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("omnion", @var{channel}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("omnioff", @var{channel}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("allsoundoff", @var{channel}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("allnotesoff", @var{channel}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("resetallcontrollers", @var{channel}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("start", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("stop", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("continue", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("systemreset", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("activesensing", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("timingclock", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("systemexclusive", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("systemexclusive", @var{bytes}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("eox", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("data", @var{bytes}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("songselect", @var{song}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("songpositionpointer", @var{songposition}, @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("tunerequest", @var{timestamp})
  ## @deftypefnx {} {@var{msg} =} midimsg ("miditimecodequarterframe", @var{timeseq}, @var{timevalue}, @var{timestamp})
  ## Create a midimsg object
  ##
  ## If the input parameter is 0, create an empty midi message object
  ## Otherwise the first variable is the type of message to create, followed by the additional
  ## parameters for the message.
  ##
  ## For each message type, the timestamp value is optional.
  ##
  ## @subsubheading Inputs
  ## @var{type} - string message type or a midimsgtype.@*
  ## @var{timestamp} - optional seconds time stamp for the event@*
  ## @var{channel} - the channel to use for the message (1..16)@*
  ## @var{note} - the value of the note to play/stop@*
  ## @var{velocity} - the velocity value for a note on/off, with 0 stopping a note from sounding.@*
  ## @var{duration} - seconds between starting and stopping a note when created a 'note' message.@*
  ## @var{prog} - program number when doing a program change message.@*
  ## @var{ccnum} - control change control number.@*
  ## @var{ccval} - control change control value.@*
  ## @var{keypressure} - key pressure value when creating a key pressure message.@*
  ## @var{chanpressure} - channel pressure value when creating a channelpressure message.@*
  ## @var{pitchchange} - pitch change value when creating a pitch bend message.@*
  ## @var{localcontrol} - boolean value when creating a localcontrol message.@*
  ## @var{monochannels} - channels specified for a mono on message.@*
  ## @var{bytes} - array of data in range of 0 to 127 specified as part of a data message or
  ## system exclusive message.@*
  ## @var{song} - song selection number for a song selection message.@*
  ## @var{songposition} - song position value for a song position message.@*
  ## @var{timeseq} - timecode sequence number for a miditimecodequarterframe message.@*
  ## @var{timevalue} - timecode value number for a miditimecodequarterframe message.@*
  ##
  ## @subsubheading Outputs
  ## @var{msg} - a midimsg object containing the midi data of the message
  ##
  ## @subsubheading Properties
  ## @var{timestamp} - timestamp of the message, or an array or timestamps if the the message is a
  ## compound message.@*
  ## @var{msgbytes} - the raw message bytes that make up the MIDI message.@*
  ## @var{nummsgbytes} - the number of message bytes that make up the MIDI message.@*
  ## @var{type} - string or midimsgtype that represents the message type.@*
  ## @var{channel} - the channel number for message.@*
  ## @var{note} - the note value for message (Only valid for noteon/off and polykeypressure).@*
  ## @var{velocity} - the velocity value for message (Only valid for noteon/off).@*
  ## @var{keypressure} - the keypressure value for message (Only valid for polykeypressure).@*
  ## @var{channelpressure} - the chanpressure value for message (Only valid for channelpressure).@*
  ## @var{localcontrol} - the localcontrol value for message (Only valid for localcontrol messages).@*
  ## @var{monochannels} - channels specified for a mono on message.@*
  ## @var{program} - program number specified for a program change message.@*
  ## @var{ccnumber} - control change number specified for a control change message.@*
  ## @var{ccvalue} - control change value specified for a control change message.@*
  ## @var{song} - song number for a song selection message.@*
  ## @var{songposition} - song position value for a song position message.@*
  ## @var{pitchchange} - pitch change value for a pitch bend message.@*
  ## @var{timecodesequence} - timecode sequence number for a miditimecodequarterframe message.@*
  ## @var{timecodevalue} - timecode value number for a miditimecodequarterframe message.@*
  ##
  ## @subsubheading Examples
  ## Create a note on/off pair with a duration of 1.5 seconds
  ## @example
  ## msg = midimsg('note', 1, 60, 100, 1.5)
  ## @end example
  ##
  ## Create a separate note on/off pair with a time between them of 1.5 seconds
  ## @example
  ## msg = [midimsg('noteon', 1, 60, 100, 0), midimsg('noteoff', 1, 60, 0, 1.5)]
  ## @end example
  ##
  ## Create a system reset message
  ## @example
  ## msg = midimsg('systemreset')
  ## @end example
  ##
  ## @seealso{midifileread, midisend, midireceive, midimsgtype}
  ## @end deftypefn

  properties (SetAccess = private, GetAccess = public)
   data = {};
   timestamp = {};
  endproperties
 
  properties (SetAccess = private, GetAccess = public)
    type; 
  endproperties

  methods
    
    function this = midimsg (typev, varargin)
      this.data = {};
      this.timestamp = {};

      if nargin < 1 || (! ischar (typev) && !isscalar (typev) && ! (class(typev) == "midimsgtype"))
        error ("Expected midi type or size");
      endif

      if strcmp (class(typev), "midimsgtype")
        typev = char(typev);
      elseif isscalar (typev)
        if typev == 0
          return; 
        else
          error ("Non zero size not supported yet");
        endif
      endif

      typev = lower (typev);
      switch typev
        case "noteon"
          # channel,note,velocity,timestamp
          if nargin < 4
            error ('noteon expects at least channel,note,velocity')
          endif
          # TODO: change channel to be 1 indexed
          chan = this.check_channel(varargin{1})-1;
          note = this.check_value127("note", varargin{2});
          vel = this.check_value127("velocity", varargin{3});
          timestamp = 0;
          if nargin > 4
            timestamp = this.check_timestamp(varargin{4});
          endif
          this.data{end+1} = uint8 ([bitor(0x90, chan), note, vel]);
          this.timestamp{end+1} = timestamp;
        case "noteoff"
          # channel,note,velocity,timestamp
          if nargin < 4
            error ('noteoff expects at least channel,note,velocity')
          endif
          chan = this.check_channel(varargin{1})-1;
          note = this.check_value127("note", varargin{2});
          vel = this.check_value127("velocity", varargin{3});
          timestamp = 0;
          if nargin > 4
            timestamp = this.check_timestamp(varargin{4});
          endif
          this.data{end+1} = uint8 ([bitor(0x80, chan), note, vel]);
          this.timestamp{end+1} = timestamp;
        case "note"
          # channel,note,velocity,duration, timestamp
          if nargin < 5
            error ('note expects at least channel,note,velocity,duration')
          endif
          chan = this.check_channel(varargin{1})-1;
          note = this.check_value127("note", varargin{2});
          vel = this.check_value127("velocity", varargin{3});
          dur = varargin{4};
          if !isscalar(dur) || !isnumeric(dur) || dur < 0
            error ('note expects at least duration to be a number >= 0')
          endif
          timestamp = 0;
          if nargin > 5
            timestamp = this.check_timestamp(varargin{5});
          endif
          this.data{end+1} = uint8 ([bitor(0x90, chan), note, vel]);
          this.timestamp{end+1} = timestamp;

          timestamp = timestamp + dur;
          this.data{end+1} = uint8 ([bitor(0x90, chan), note, 0]);
          this.timestamp{end+1} = timestamp;
        case "programchange"
          # channel,prog, timestamp
          if nargin < 3
            error ('programchange expects at least channel,program')
          endif
          chan = this.check_channel(varargin{1})-1;
          prog = this.check_value127("program", varargin{2});
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          this.data{end+1} = uint8([bitor(0xc0, chan), prog]);
          this.timestamp{end+1} = timestamp;

        case "controlchange"
          # channel,ccnum, ccval,timestamp
          if nargin < 4
            error ('controlchange expects at least channel,ccnum,ccval')
          endif
          chan = this.check_channel(varargin{1})-1;
          ccnum = this.check_value119("ccnum", varargin{2});
          ccval = this.check_value127("ccval", varargin{3});
          timestamp = 0;
          if nargin > 4
            timestamp = this.check_timestamp(varargin{4});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), ccnum, ccval]);
          this.timestamp{end+1} = timestamp;

        case "polykeypressure"
          # channel, note, pressure, timestamp
          if nargin < 4
            error ('polykeypressure expects at least channel,note,keypressure')
          endif
          chan = this.check_channel(varargin{1})-1;
          note = this.check_value127("note", varargin{2});
          pres = this.check_value127("pressure", varargin{3});
          timestamp = 0;
          if nargin > 4
            timestamp = this.check_timestamp(varargin{4});
          endif
          this.data{end+1} = uint8([bitor(0xa0, chan), note pres]);
          this.timestamp{end+1} = timestamp;

        case "channelpressure"
          # channel, pressure, timestamp
          if nargin < 3
            error ('channelpressure expects at least channel,keypressure')
          endif
          chan = this.check_channel(varargin{1})-1;
          pres = this.check_value127("pressure", varargin{2});
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          this.data{end+1} = uint8([bitor(0xd0, chan), pres]);
          this.timestamp{end+1} = timestamp;

        case "localcontrol"
          # channel, localcontrol, timestamp
          if nargin < 3
            error ('localcontrol expects at least channel,localcontrol')
          endif
          chan = this.check_channel(varargin{1})-1;
          local = this.check_value1("localcontrol", varargin{2});
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 122, local]);
          this.timestamp{end+1} = timestamp;

        case "pitchbend"
          # channel, pitchchange, timestamp
          if nargin < 3
            error ('pitchbend expects at least channel,pitchchange')
          endif
          chan = this.check_channel(varargin{1})-1;
          # pitch is 0 .. 16383 where 8120 is no change
          # pitch = uint16(varargin{2} + 0x2000);
          pitch = uint16(this.check_value16383("pitchchange", varargin{2}));
          pitchlo = bitand(pitch, uint16(0x7F));
          pitchhi = bitand(bitshift(pitch, -7), uint16(0x7f));
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          this.data{end+1} = uint8([bitor(0xe0, chan), pitchlo pitchhi]);
          this.timestamp{end+1} = timestamp;

        case "polyon"
          # channel, timestamp
          if nargin < 2
            error ('polyon expects at least channel')
          endif
          chan = this.check_channel(varargin{1})-1;
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 127]);
          this.timestamp{end+1} = timestamp;

        case "monoon"
          # channel,  monochan, timestamp
          if nargin < 3
            error ('monoon expects at least channel and monochannels')
          endif
          chan = this.check_channel(varargin{1})-1;
          mono = this.check_value16("monochannels", varargin{2});
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 126, mono]);
          this.timestamp{end+1} = timestamp;

        case "omnion"
          # channel, timestamp
          if nargin < 2
            error ('omnion expects at least channel')
          endif
          chan = this.check_channel(varargin{1})-1;
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 125]);
          this.timestamp{end+1} = timestamp;

        case "omnioff"
          # channel, timestamp
          if nargin < 2
            error ('omnioff expects at least channel')
          endif
          chan = this.check_channel(varargin{1})-1;
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 124]);
          this.timestamp{end+1} = timestamp;

        case "allsoundoff"
          # channel, timestamp
          if nargin < 2
            error ('allsoundoff expects at least channel')
          endif
          chan = this.check_channel(varargin{1})-1;
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 120]);
          this.timestamp{end+1} = timestamp;

        case "allnotesoff"
          # channel, timestamp
          if nargin < 2
            error ('allnotesoff expects at least channel')
          endif
          chan = this.check_channel(varargin{1})-1;
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 123]);
          this.timestamp{end+1} = timestamp;

        case "resetallcontrollers"
          # channel, timestamp
          if nargin < 2
            error ('resetallcontrollers expects at least channel')
          endif
          chan = this.check_channel(varargin{1})-1;
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 121]);
          this.timestamp{end+1} = timestamp;

        case "songselect"
          if nargin < 2
            error ('songselect expects at least song number')
          endif
          timestamp = 0;
          song = this.check_value127("songnumber", varargin{1});
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([0xF3 song]);
          this.timestamp{end+1} = timestamp;

        case "songpositionpointer"
          if nargin < 2
            error ('song expects at least song position')
          endif
          timestamp = 0;
          songpos = uint16(this.check_value16383("songposiition", varargin{1}));
          songlo = bitand(songpos, uint16(0x7F));
          songhi = bitand(bitshift(songpos, -7), uint16(0x7f));
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8([0xF2 songlo songhi]);
          this.timestamp{end+1} = timestamp;

        case "miditimecodequarterframe"
          # timeseq, timeval, timestamp
          if nargin < 3
            error ('miditimecodequarterframe expects at least timeseq and value')
          endif
          seq = this.check_value7("timeseq", varargin{1});
          val = this.check_value15("timeval", varargin{2});
          seq = bitand(uint8(seq), 3);
          val = bitand(uint8(val), 7);
          data = bitshift(seq, 3) + val;
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          this.data{end+1} = uint8([0xF1 data]);
          this.timestamp{end+1} = timestamp;

        case "start"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xFA]);
          this.timestamp{end+1} = timestamp;

        case "stop"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xFC]);
          this.timestamp{end+1} = timestamp;

        case "continue"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xFB]);
          this.timestamp{end+1} = timestamp;

        case "systemreset"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xFF]);
          this.timestamp{end+1} = timestamp;

        case "activesensing"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xFE]);
          this.timestamp{end+1} = timestamp;

        case "timingclock"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xF8]);
          this.timestamp{end+1} = timestamp;

        case "tunerequest"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xF6]);
          this.timestamp{end+1} = timestamp;

        case "data"
          # data, timestamp
          if nargin < 2
            error ('data type expects at least data')
          endif
 
          timestamp = 0;
          if nargin > 2
            timestamp = this.check_timestamp(varargin{2});
          endif
          this.data{end+1} = uint8(varargin{1});
          this.timestamp{end+1} = timestamp;

        case "eox"
          timestamp = 0;
          if nargin > 1
            timestamp = this.check_timestamp(varargin{1});
          endif
          this.data{end+1} = uint8([0xF7]);
          this.timestamp{end+1} = timestamp;

        case "systemexclusive"
          # timestamp
          # or data + timestamp
          if nargin == 1
            timestamp = 0;
            data = [];
          elseif nargin == 2
            if !isscalar(varargin{1}) && isvector(varargin{1})
              data = uint8(varargin{1});
              timestamp = 0;
            else
              data = [];
              timestamp = this.check_timestamp(varargin{1});
            endif
          elseif nargin == 3
            data = uint8(varargin{1});
            timestamp = this.check_timestamp(varargin{2});
          else
            error ("systemexclusive expects optional data and timestamp only");
          endif

          this.data{end+1} = uint8([0xF0]);
          this.timestamp{end+1} = timestamp;

          # want to build a full SOX data EOX
          if !isempty(data)
            this.data{end+1} = data;
            this.timestamp{end+1} = timestamp;

            this.data{end+1} = uint8([0xF7]);
            this.timestamp{end+1} = timestamp;
          endif

        case "metaevent"
          if nargin < 3
            error ('metaevent expects at least metatype and data')
          endif
          timestamp = 0;
          if nargin > 3
            timestamp = this.check_timestamp(varargin{3});
          endif
          # TODO: could be a integer or char type for metatype
          event  = this.check_value127("metatype", varargin{1});
          data  = uint8(varargin{2});  # TODO: check validity of the data <= 127
          datasize = midimsg.makevariable(length(data));
          this.data{end+1} = uint8([0xFF event datasize data]);
          this.timestamp{end+1} = timestamp;

        otherwise
          error ("Unknown midi type '%s", typev);
      endswitch
       
    endfunction

    function a = horzcat (a, varargin)
      
      if !isa(a, 'midimsg')
        error ("Cannot concatenate non midimsg elements");
      endif

      for i = 1:nargin-1
        b = varargin{i};
        if !isa(b, 'midimsg')
          error ("Cannot concatenate non midimsg elements");
        endif
        for idx=1:length (b.data)
          a.data{end+1} = b.data{idx};
          a.timestamp{end+1} = b.timestamp{idx};
        endfor
      endfor
    endfunction

    function e = isempty (this)
      e = isempty(this.data);
    endfunction

    function e = length (this)
      e = length(this.data);
    endfunction

    function this = subsasgn (this, s, rhs)
      if isempty(s)
        error ("midimsg.subsref missing index");
      endif

      switch (s(1).type)
        case "."
          if length(this.timestamp) > 1
            error ("Can not set %s on mutiple messages yet", s(1).subs);
          endif
          switch tolower(s(1).subs)
            case "timestamp"
              this.timestamp{1} = this.check_timestamp(rhs);

            case "channel"
              chan = this.check_channel(rhs);
              data = this.data{1};
              data(1) = bitor(bitand(data(1), 0xF0), (chan-1));
              this.data{1} = data;

            case "note"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if !(cmd == 0x80 || cmd == 0x90 || cmd == 0xA0)
                error ("note property only valid for noteon/off and polykeypressure");
              endif
              data(2) = this.check_value127("note", rhs);
              this.data{1} = data;

            case "velocity"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if !(cmd == 0x80 || cmd == 0x90)
                error ("velocity property only valid for noteon/off");
              endif
              data(3) = this.check_value127("velocity", rhs);
              this.data{1} = data;

            case "channelpressure"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if !(cmd == 0xD0)
                error ("channel property only valid for channelpressure messages");
              endif
              data(2) = this.check_value127("channelpressure", rhs);
              this.data{1} = data;

            case "keypressure"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if !(cmd == 0xA0)
                error ("keypressure property only valid for polykeypressure messages");
              endif
              data(3) = this.check_value127("keypressure", rhs);
              this.data{1} = data;

            case "ccnumber"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd != 0xB0 || data(2) > 119
                error ("ccnumber property only valid for controlchange messages");
              endif
              data(2) = this.check_value119("ccnumber", rhs);
              this.data{1} = data;

            case "ccvalue"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd != 0xB0 || data(2) > 119
                error ("ccnumber property only valid for controlchange messages");
              endif
              data(3) = this.check_value127("ccvalue", rhs);
              this.data{1} = data;

            case "song"
              data = this.data{1};
              cmd = data(1);
              if cmd != 0xF3
                error ("song property only valid for song select messages");
              endif
              data(2) = this.check_value127("song", rhs);
              this.data{1} = data;

            case "songposition"
              data = this.data{1};
              cmd = data(1);
              if cmd != 0xF2
                error ("songposition property only valid for songpositionpointer messages");
              endif

              songpos = uint16(this.check_value16383("songposition", rhs));
              songlo = bitand(songpos, uint16(0x7F));
              songhi = bitand(bitshift(songpos, -7), uint16(0x7f));

              data(2) = songlo;
              data(3) = songhi;

              this.data{1} = data;

            case "pitchchange"
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd != 0xE0
                error ("pitchchange property only valid for pitchbend messages");
              endif

              pitchchange = uint16(this.check_value16383("pitchchange", rhs));
              pitchlo = bitand(pitchchange, uint16(0x7F));
              pitchhi = bitand(bitshift(pitchchange, -7), uint16(0x7f));

              data(2) = pitchlo;
              data(3) = pitchhi;

              this.data{1} = data;

            case "timecodesequence"
              data = this.data{1};
              cmd = data(1);
              if cmd != 0xF1
                error ("timecodesequence property only valid for miditimecodequaterframe messages");
              endif
  
              seq = bitshift(data(2), -3);
              val = bitand(data(2), 7);

              seq = this.check_value7("timecodesequence", rhs);

              data(2) = bitshift(seq, 3) + val;

              this.data{1} = data;

            case "timecodevalue"
              data = this.data{1};
              cmd = data(1);
              if cmd != 0xF1
                error ("value property only valid for miditimecodequaterframe messages");
              endif
  
              seq = bitshift(data(2), -3);
              val = bitand(data(2), 7);

              val = this.check_value15("timecodevalue", rhs);
              val = bitand(uint8(val), 7);

              data(2) = bitshift(seq, 3) + val;

              this.data{1} = data;

            otherwise
              error("unimplemented midimsg.subsasgn property '%s'", s(1).subs);
          endswitch

        case "()"
          idx = s(1).subs;
          if (numel (idx) != 1)
            error ("@midimsg/subsasgn: needs exactly one index");
          endif
          if numel (s) == 1
            # assign a value to here - so verify is a midimsg
            if !isa(rhs, "midimsg")
              error ("midimsg.subsasgn rhs of indexed value must be a midimsg");
            endif
            val = rhs;
          else
            # extract out midimsg value and do assign on it
            val = midimsg.createMessage(this.data{idx{1}}, this.timestamp{idx{1}});
            val = subsasgn (val, s(2:end), rhs);
          endif
          # store the modded data back in our object
          this.data{idx{1}} = val.data{1};
          this.timestamp{idx{1}} = val.timestamp{1};
 
        otherwise
          error("unimplemented midimsg.subsasgn type");
      endswitch
    endfunction

    function val = subsref (this, s)
      if isempty(s)
        error ("midimsg.subsref missing index");
      endif

      switch (s(1).type)
        case "()"
          idx = s(1).subs;
          if (numel (idx) != 1)
            error ("@midimsg/subsref: need exactly one index");
          endif
          val = midimsg.createMessage(this.data{idx{1}}, this.timestamp{idx{1}});
        case "."
          switch tolower(s(1).subs)
          case "timestamp"
            if length(this.timestamp) == 1
              val = this.timestamp{1};
            else
              val = this.timestamp;
            endif
          case "msgbytes"
            if length(this.data) == 1
              val = this.data{1};
            else
              val = this.data;
            endif
          case "nummsgbytes"
            if length(this.data) > 0
              val = length(this.data{1});

              if length(this.data) > 1
                for idx = 2:length(this.data)
                  val = [val length(this.data{idx})];
                endfor
              endif
            else
              val = 0;
            endif
          case "type"
            if length(this.data) > 0
              data = this.data{1};
              val = this.type_enum(this.data{1}); 
              if length(this.data) > 1
                # we cant override cellstr yes, so just use strings for multiples
                val = {char(val)}; 
                for idx = 2:length(this.data)
                  val{end+1} = this.type_str(this.data{idx});
                endfor
              endif
            else
              val = midimsgtype.Undefined;
            endif
          case "channel"
            if length(this.data) > 0
              data = this.data{1};
              val = bitand(data(1), 0x0F) + 1;
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  val = [val (bitand(data(1), 0x0F)+1)];
                endfor
              endif
              val = double(val);
            endif
          case "note"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0x80 || cmd == 0x90 || cmd == 0xA0
                val = data(2);
              else
                error ("note property only valid for noteon/off and polykeypressure");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0x80 || cmd == 0x90 || cmd == 0xA0
                    val = [val data(2)];
                  else
                    error ("note property only valid for noteon/off and polykeypressure");
                  endif
                endfor
              endif
              val = double(val);
            endif
          case "velocity"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0x80 || cmd == 0x90
                val = data(3);
              else
                error ("velocity property only valid for noteon/off");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0x80 || cmd == 0x90
                    val = [val data(3)];
                  else
                    error ("velocity property only valid for noteon/off");
                  endif
                endfor
              endif
              val = double(val);
            endif
          case "keypressure"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xA0
                val = data(3);
              else
                error ("keypressure property only valid for polykeypressure");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xA0
                    val = [val data(3)];
                  else
                    error ("keypressure property only valid for polykeypressure");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "channelpressure"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xD0
                val = data(2);
              else
                error ("channelpressure property only valid for channelpressure");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xD0
                    val = [val data(2)];
                  else
                    error ("keypressure property only valid for channelpressure");
                  endif
                endfor
              endif
              val = double(val);
            endif
 
          case "localcontrol"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xB0 && data(2) == 122
                val = data(3);
              else
                error ("localcontrol property only valid for localcontrol messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xB0 && data(2) == 122
                    val = [val data(3)];
                  else
                    error ("localcontrol property only valid for localcontrol messages");
                  endif
                endfor
              endif
              val = double(val);
            endif
          case "monochannels"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xB0 && data(2) == 126
                val = data(3);
              else
                error ("monochannels property only valid for monoon messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xB0 && data(2) == 126
                    val = [val data(3)];
                  else
                    error ("monochannels property only valid for monoon messages");
                  endif
                endfor
              endif
              val = double(val);
            endif
          case "program"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xC0
                val = data(2);
              else
                error ("program property only valid for programchange messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xC0
                    val = [val data(2)];
                  else
                    error ("program property only valid for programchange messages");
                  endif
                endfor
              endif
              val = double(val);
            endif
          case "ccnumber"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xB0 && data(2) <= 119
                val = data(2);
              else
                error ("ccnumber property only valid for controlchange messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xB0 && data(2) <= 119
                    val = [val data(2)];
                  else
                    error ("ccnumber property only valid for controlchange messages");
                  endif
                endfor
              endif
              val = double(val);
            endif
          case "ccvalue"
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xB0 && data(2) <= 119
                val = data(3);
              else
                error ("ccvalue property only valid for controlchange messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xB0 && data(2) <= 119
                    val = [val data(3)];
                  else
                    error ("ccvalue property only valid for controlchange messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "song"
            if length(this.data) > 0
              data = this.data{1};
              cmd = data(1);
              if cmd == 0xF3
                val = data(2);
              else
                error ("song property only valid for songselect messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = data(1);
                  if cmd == 0xF3
                    val = [val data(2)];
                  else
                    error ("song property only valid for songselect messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "songposition"
          
            if length(this.data) > 0
              data = this.data{1};
              cmd = data(1);
              if cmd == 0xF2
                val = bitshift(int16(data(3)), 7) + int16(data(2));
              else
                error ("songpostion property only valid for songpositionpointer messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = data(1);
                  if cmd == 0xF2
                    v = bitshift(int16(data(3)), 7) + int16(data(2));
                    val = [val v];
                  else
                    error ("songposition property only valid for songpositionpointer messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "pitchchange"
          
            if length(this.data) > 0
              data = this.data{1};
              cmd = bitand(data(1), 0xF0);
              if cmd == 0xE0
                val = bitshift(int16(data(3)), 7) + int16(data(2));
              else
                error ("pitchchange property only valid for pitchbend messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = bitand(data(1), 0xF0);
                  if cmd == 0xF2
                    v = bitshift(int16(data(3)), 7) + int16(data(2));
                    val = [val v];
                  else
                    error ("picthchange property only valid for pitchbend messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "timecodesequence"
          
            if length(this.data) > 0
              data = this.data{1};
              cmd = data(1);
              if cmd == 0xF1
                val = bitshift(data(2), -3);
              else
                error ("timecodesequence property only valid for miditimecodequarterframe messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = data(1);
                  if cmd == 0xF1
                    v = bitshift(data(2), -3);
                    val = [val v];
                  else
                    error ("timecodesequence property only valid for miditimecodequaterframe messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "timecodevalue"

            if length(this.data) > 0
              data = this.data{1};
              cmd = data(1);
              if cmd == 0xF1
                val = bitand(data(2), 7);
              else
                error ("timecodevalue property only valid for miditimecodequarterframe messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = data(1);
                  if cmd == 0xF1
                    v = bitand(data(2), 7);
                    val = [val v];
                  else
                    error ("timecodevalue property only valid for miditimecodequaterframe messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "metatype"

            if length(this.data) > 0
              data = this.data{1};
              cmd = data(1);
              if cmd == 0xFF && length(data) > 1
                val = data(2);
              else
                error ("metatype property only valid for metaevent messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = data(1);
                  if cmd == 0xFF &&  length(data) > 1
                    val = data(2);
                    val = [val v];
                  else
                    error ("metatype property only valid for metaevent messages");
                  endif
                endfor
              endif
              val = double(val);
            endif

          case "metadata"

            if length(this.data) > 0
              data = this.data{1};
              cmd = data(1);
              len = length(data);
              if cmd == 0xFF && len > 1
                if len < 128
                  val = data(4:len);
                elseif len < 128*128
                  val = data(5:len);
                elseif len < 128*128*128
                  val = data(6:len);
                else
                  val = data(7:len);
                endif
              else
                error ("metadata property only valid for metaevent messages");
              endif
              if length(this.data) > 1
                for idx = 2:length(this.data)
                  data = this.data{idx};
                  cmd = data(1);
                  len = length(data);
                  if cmd == 0xFF && len > 1
                    if len < 128
                      v = data(4:len);
                    elseif len < 128*128
                      v = data(5:len);
                    elseif len < 128*128*128
                      v = data(6:len);
                    else
                      v = data(7:len);
                    endif
                    val = [val v];
                  else
                    error ("metadata property only valid for metaevent messages");
                  endif
                endfor
              endif
            endif

          otherwise
            error("unimplemented midimsg.subsref property '%s'", s(1).subs);
          endswitch
        otherwise
          error("unimplemented midimsg.subsref type");
      endswitch

      if (numel (s) > 1)
        val = subsref (val, s(2:end));
      endif
    endfunction

    function msg = sort (this)
      msg = midimsg(0);

      # TODO: store timestamp as matrix not a cell
      # then could just use sort, and no swaps ?
      [~, s_idx] = sort(cell2mat(this.timestamp'));

      s_idx = s_idx';

      for idx = 1:numel(s_idx)
        msg.timestamp{end+1} = this.timestamp{s_idx(idx)};
        msg.data{end+1} = this.data{s_idx(idx)};
      endfor

    endfunction

    function out = disp (this)
      if nargout == 0
        disp(" MIDI message:");
      else
        out = "";
      endif
      for idx=1:length(this.data)
        data =  this.data{idx};
        cmd = data(1);
        types = this.type_str(data); 

        if bitand(cmd, 0xF0) != 0xF0 && bitand(cmd, 0x80) != 0
          chan = bitand(cmd, 0x0F) + 1;
          msgtext = sprintf ("%-10s Channel: %2d", types, chan);
        else
          msgtext = sprintf ("%-10s", types);
        endif

        if strcmp(types, "NoteOn") || strcmp(types, "NoteOff")
          msgtext = [msgtext sprintf(" Note: %3d Velocity: %3d", data(2), data(3))];
        endif
        if strcmp(types, "ProgramChange")
          msgtext = [msgtext sprintf(" Program: %3d", data(2))];
        endif
        if strcmp(types, "ControlChange")
          msgtext = [msgtext sprintf(" CCNumber: %3d CCValue: %3d", data(2), data(3))];
        endif
        if strcmp(types, "PitchBend")
          v = bitshift(int16(data(3)), 7) + int16(data(2));
          msgtext = [msgtext sprintf(" PitchChange: %d", v)];
        endif
        if strcmp(types, "ChannelPressure")
          msgtext = [msgtext sprintf(" ChannelPressure: %3d", data(2))];
        endif
        if strcmp(types, "PolyKeyPressure")
          msgtext = [msgtext sprintf(" Note: %3d KeyPressure: %3d", data(2), data(3))];
        endif
        if strcmp(types, "LocalControl")
          msgtext = [msgtext sprintf(" LocalControl: %3d", data(3))];
        endif
        if strcmp(types, "MonoOn")
          msgtext = [msgtext sprintf(" MonoChannels: %3d", data(3))];
        endif
        if strcmp(types, "SongSelect")
          msgtext = [msgtext sprintf(" Song: %3d", data(2))];
        endif
        if strcmp(types, "SongPositionPointer")
          v = bitshift(int16(data(3)), 7) + int16(data(2));
          msgtext = [msgtext sprintf(" SongPosition: %d", v)];
        endif
        if strcmp(types, "MIDITimeCodeQuarterFrame")
          seq = bitshift(data(2), -3);
          val = bitand(data(2), 7);
          msgtext = [msgtext sprintf(" TimeCodeSequence: %d TimeCodeValue: %d", seq, val)];
        endif
        if strcmp(types, "MetaEvent")
          metatype = data(2);
          msgtext = [msgtext sprintf(" MetaType: %d", metatype)];
        endif

        msgtext = [msgtext sprintf(" Timestamp: %f", this.timestamp{idx})];
        msgtext = [msgtext sprintf(" [")];
        msgtext = [msgtext sprintf(" 0x%02X", data)];
        msgtext = [msgtext sprintf(" ]")];
        if nargout == 0
          disp(["   "  msgtext]);
        else
          out = [out msgtext "\n"];
        endif
      endfor
    endfunction
    
    function d = uint8 (this)
      d = this.data;
    endfunction

  endmethods

  methods (Access = private)
    function t = check_timestamp(this, ts)
      if !isscalar (ts) || !isnumeric(ts) || ts < 0
        error ("expected timestamp to be a number >= 0");
      endif
      t = ts;
    endfunction

    function c = check_channel(this, chan)
      if !isscalar (chan) || !isnumeric(chan) || chan < 1 || chan > 16
        error ("expected channel to be a number between 1..16");
      endif
      c = chan;
    endfunction

    function v = check_value127(this, name, value)
      if !isscalar (value) || !isnumeric(value) || value < 0 || value > 127
        error ("expected %s to be a number between 0..127", name);
      endif
      v = value;
    endfunction

    function v = check_value1(this, name, value)
      if !isscalar (value) || !(islogical(value) || isnumeric(value)) || value < 0 || value > 1
        error ("expected %s to be a number between 0..1", name);
      endif
      v = value;
    endfunction

    function v = check_value7(this, name, value)
      if !isscalar (value) || !isnumeric(value) || value < 0 || value > 7
        error ("expected %s to be a number between 0..7", name);
      endif
      v = value;
    endfunction

    function v = check_value15(this, name, value)
      if !isscalar (value) || !isnumeric(value) || value < 0 || value > 7
        error ("expected %s to be a number between 0..15", name);
      endif
      v = value;
    endfunction

    function v = check_value16(this, name, value)
      if !isscalar (value) || !isnumeric(value) || value < 0 || value > 16
        error ("expected %s to be a number between 0..16", name);
      endif
      v = value;
    endfunction

    function v = check_value119(this, name, value)
      if !isscalar (value) || !isnumeric(value) || value < 0 || value > 119
        error ("expected %s to be a number between 0..119", name);
      endif
      v = value;
    endfunction

    function v = check_value16383(this, name, value)
      if !isscalar (value) || !isnumeric(value) || value < 0 || value > 16383
        error ("expected %s to be a number between 0..16386", name);
      endif
      v = value;
    endfunction

    function v = type_enum (this, data)
      cmd = 0;
      b1 = 0;
      if length(data) > 0
        cmd = data(1);
      endif
      if length(data) > 1
        b1 = data(2);
      endif

      cmdgrp = bitand(cmd, 0xF0);
      switch (cmdgrp)
       case 0x80
         v = midimsgtype.NoteOff;             
       case 0x90
         v = midimsgtype.NoteOn;
       case 0xA0
         v = midimsgtype.PolyKeyPressure;
       case 0xB0
         # depends on next byte for actual msg
         if b1 == 120
           v = midimsgtype.AllSoundOff;
         elseif b1 == 121
           v = midimsgtype.ResetAllControllers;
         elseif b1 == 122
           v = midimsgtype.LocalControl;
         elseif b1 == 123
           v = midimsgtype.AllNotesOff;
         elseif b1 == 124
           v = midimsgtype.OmniOff;
         elseif b1 == 125
           v = midimsgtype.OmniOn;
         elseif b1 == 126
           v = midimsgtype.MonoOn;
         elseif b1 == 127
           v = midimsgtype.PolyOn;
         else
           v = midimsgtype.ControlChange;
         endif
       case 0xC0
         v = midimsgtype.ProgramChange;             
       case 0xD0
         v = midimsgtype.ChannelPressure;             
       case 0xE0
         v = midimsgtype.PitchBend;             
       case 0xF0
         if cmd == 0xF0
           v = midimsgtype.SystemExclusive;
         elseif cmd == 0xF1
           v = midimsgtype.MIDITimeCodeQuarterFrame;
         elseif cmd == 0xF2
           v = midimsgtype.SongPositionPointer;
         elseif cmd == 0xF3
           v = midimsgtype.SongSelect;
         elseif cmd == 0xF4
           v = midimsgtype.Reserved;
         elseif cmd == 0xF5
           v = midimsgtype.Reserved;
         elseif cmd == 0xF6
           v = midimsgtype.TuneRequest;
         elseif cmd == 0xF7
           v = midimsgtype.EOX;
         elseif cmd == 0xF8
           v = midimsgtype.TimingClock;
         elseif cmd == 0xF9
           v = midimsgtype.Reserved;
         elseif cmd == 0xFA
           v = midimsgtype.Start;
         elseif cmd == 0xFB
           v = midimsgtype.Continue;
         elseif cmd == 0xFC
           v = midimsgtype.Stop;
         elseif cmd == 0xFD
           v = midimsgtype.Reserved;
         elseif cmd == 0xFE
           v = midimsgtype.ActiveSensing;
         elseif cmd == 0xFF
           v = midimsgtype.SystemReset;
           if length(data) > 1
             v = midimsgtype.MetaEvent;
           endif
         endif
         # depend  on other bytes ?
       otherwise
         if length(data) < 1
           v = midimsgtype.Undefined;
         else
           v = midimsgtype.Data;
         endif
      endswitch
      
    endfunction

    function v = type_str (this, data)
      v = char(this.type_enum(data));
    endfunction

  endmethods

  methods (Static=true)
    function msg = createMessage (data, ts)
      if nargin < 1 || !isa (data, 'uint8') || !ismatrix (data)
        error ("Expected matrix of uint8 data")
      endif
      if nargin < 2
        ts = 0;
      endif
      msg = midimsg(0);
      msg.data{end+1} = data;
      msg.timestamp{end+1} = ts;
    endfunction
  endmethods

  methods (Static = true)
    # octave 5 wont allow us to call private funcs from the class
    # so a copy of private/makevariable is here
    function data = makevariable (value)
      t = uint64(value);
      if t < 128
        v = uint8(t);
        data = [v];
      else
        tmp = dec2bin(t);
        while mod(length(tmp), 7) != 0
          tmp = [ "0" tmp ];
        endwhile
        data = [];
        for i=1:7:length(tmp)
          v = tmp(i:i+6);
          v = uint8(bin2dec(v));
          if i < length(tmp) -7
            v = 128 + v;
          endif

          data = [data v];
        endfor
      endif
    endfunction

  endmethods

endclassdef

%!fail midimsg('badtype')

%!fail midimsg

%!test
%! a = midimsg(0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 0);
%! assert(isempty(a));

%!fail midimsg("note", 0, 60, 127, 2)
%!fail midimsg("note", 17, 60, 127, 2)
%!fail midimsg("note", 1, 128, 127, 2)
%!fail midimsg("note", 1, -1, 127, 2)
%!fail midimsg("note", 1, 60, 128, 2)
%!fail midimsg("note", 1, 60, -1, 2)
%!fail midimsg("note", 1, 60, 127, -1)
%!fail midimsg("note", 1, 60, 127, 2, -1)

%!test
%! a = midimsg("note", 1, 60, 127, 2);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 2);
%! assert(!isempty(a));
%! assert(a.channel, [1 1]);
%! a = midimsg("note", 2, 60, 127, 1.2);
%! t = a.type;
%! assert(length(t) == 2);
%! assert(strcmp(t{1}, "NoteOn"))
%! assert(strcmp(t{2}, "NoteOn"))
%! t = a.timestamp;
%! assert(length(t) == 2);
%! assert(t{1}, 0.0)
%! assert(t{2}, 1.2)
%! assert(a.channel, [2 2]);

%!test
%! a = midimsg("noteon", 1, 60, 20);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "NoteOn");
%! assert(a.channel, 1);
%! assert(a.msgbytes, uint8([0x90 0x3C 0x14]));
%! assert(!isempty(a));
%! a = midimsg("noteon", 2, 60, 20);
%! assert(a.channel, 2);
%! assert(a.msgbytes, uint8([0x91 0x3C 0x14]));

%!test
%! % using midimsgtype enum
%! a = midimsg(midimsgtype.NoteOn, 1, 60, 20);
%! assert(isa(a, "midimsg"));
%! assert(a.type == "NoteOn");

%!test
%! a = midimsg("noteoff", 1, 60, 20);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "NoteOff");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0x80 0x3C 0x14]));

%!test
%! a = midimsg("programchange", 1, 60);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "ProgramChange");
%! assert(a.program, 60);
%! assert(a.channel, 1);
%! assert(a.nummsgbytes, 2);
%! assert(a.msgbytes, uint8([0xC0 60]));
%! assert(!isempty(a));

%!test
%! a = midimsg("controlchange", 1, 60, 65);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "ControlChange");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.ccnumber, 60)
%! assert(a.ccvalue, 65)
%! a.ccnumber = 0;
%! a.ccvalue = 4;
%! assert(a.ccnumber, 0)
%! assert(a.ccvalue, 4)

%!test
%! a = midimsg("polykeypressure", 1, 60, 65);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "PolyKeyPressure");
%! assert(a.nummsgbytes, 3);
%! assert(a.note, 60);
%! assert(a.keypressure, 65);
%! assert(!isempty(a));
%!
%! a.keypressure = 40;
%! assert(a.keypressure, 40);

%!test
%! a = midimsg("pitchbend", 1, 8192);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "PitchBend");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xE0 0x00 0x40]));
%! assert(a.pitchchange, 8192);
%! assert(a.channel, 1);
%! a.pitchchange = 8200;
%! assert(a.pitchchange, 8200);

%!test
%! a = midimsg("channelpressure", 1, 60);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "ChannelPressure");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));
%! assert(a.channelpressure, 60);
%!
%! a.channelpressure = 40;
%! assert(a.channelpressure, 40);

%!test
%! a = midimsg("localcontrol", 1, 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "LocalControl");
%! assert(a.nummsgbytes, 3);
%! assert(a.localcontrol, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xB0 122 0x01]));
%!
%! a = midimsg("localcontrol", 2, 0);
%! assert(a.msgbytes, uint8([0xB1 122 0x00]));
%! assert(a.localcontrol, 0);
%! assert(a.channel, 2);

%!test
%! a = midimsg("polyon", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "PolyOn");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("monoon", 1, 0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "MonoOn");
%! assert(a.monochannels, 0);
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));

%!test
%! a = midimsg("omnion", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "OmniOn");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("omnioff", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "OmniOff");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("allsoundoff", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "AllSoundOff");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("allnotesoff", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "AllNotesOff");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("resetallcontrollers", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "ResetAllControllers");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("systemreset");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "SystemReset");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFF]));

%!test
%! a = midimsg("start");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "Start");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFA]));

%!test
%! a = midimsg("stop");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "Stop");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFC]));

%!test
%! a = midimsg("continue");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "Continue");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFB]));

%!test
%! a = midimsg("activesensing");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "ActiveSensing");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFE]));

%!test
%! a = midimsg("timingclock");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "TimingClock");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF8]));

%!test
%! a = midimsg("eox");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "EOX");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF7]));

%!test
%! a = midimsg("data", [1 2 3]);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "Data");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([1 2 3]));

%!test
%! a = midimsg("songselect", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "SongSelect");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF3 1]));
%! assert(a.song, 1);
%! a.song = 2;
%! assert(a.song, 2);
%! assert(a.msgbytes, uint8([0xF3 2]));

%!test
%! a = midimsg("songpositionpointer", 0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "SongPositionPointer");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF2 0 0]));
%! assert(a.songposition, 0);
%! a.songposition = 1000;
%! assert(a.songposition, 1000);

%!test
%! a = midimsg("tunerequest");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "TuneRequest");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF6]));

%!test
%! a = midimsg("miditimecodequarterframe", 1, 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "MIDITimeCodeQuarterFrame");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF1 9]));
%! assert(a.timecodesequence, 1);
%! assert(a.timecodevalue, 1);
%! a.timecodesequence = 5;
%! assert(a.timecodesequence, 5);
%! assert(a.timecodevalue, 1);
%! a.timecodevalue = 2;
%! assert(a.timecodesequence, 5);
%! assert(a.timecodevalue, 2);

%!test
%! a = midimsg("systemexclusive");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "SystemExclusive");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF0]));
%!
%! a = midimsg("systemexclusive", 1.0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "SystemExclusive");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF0]));
%! assert(a.timestamp, 1.0);
%!
%! a = midimsg("systemexclusive", [1 2 3]);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 3);
%! assert(a.type, {"SystemExclusive", "Data", "EOX"});
%! assert(a.nummsgbytes, [1 3 1]);
%! assert(!isempty(a));
%! assert(a(1).msgbytes, uint8([0xF0]));
%! assert(a(1).timestamp, 0.0);
%! assert(a(2).msgbytes, uint8([1 2 3]));
%! assert(a(2).timestamp, 0.0);
%! assert(a(3).msgbytes, uint8([0xF7]));
%! assert(a(3).timestamp, 0.0);
%!
%! a = midimsg("systemexclusive", [1 2 3], 5);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 3);
%! assert(a.type, {"SystemExclusive", "Data", "EOX"});
%! assert(a.nummsgbytes, [1 3 1]);
%! assert(!isempty(a));
%! assert(a(1).msgbytes, uint8([0xF0]));
%! assert(a(1).timestamp, 5.0);
%! assert(a(2).msgbytes, uint8([1 2 3]));
%! assert(a(2).timestamp, 5.0);
%! assert(a(3).msgbytes, uint8([0xF7]));
%! assert(a(3).timestamp, 5.0);

%!test
%! a = midimsg("noteon", 1, 60, 20);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "NoteOn");
%! assert(a.note, 60);
%! assert(a.velocity, 20);
%! b = midimsg("noteoff", 2, 60, 10, 5.0);
%! assert(isa(b, "midimsg"));
%! assert(length(b) == 1);
%! assert(b.type == "NoteOff");
%! assert(b.note, 60);
%! assert(b.velocity, 10);
%! c = [a b];
%! assert(isa(c, "midimsg"));
%! assert(length(c) == 2);
%! assert(c.nummsgbytes, [3 3]);
%! assert(c.channel, [1 2]);
%! assert(c.note, [60 60]);
%! assert(c.velocity, [20 10]);
%! assert(c(1).type == "NoteOn");
%! assert(c(1).channel, 1);
%! assert(c(1).note, 60);
%! assert(c(1).velocity, 20);
%! assert(c(2).type == "NoteOff");
%! assert(c(2).timestamp, 5.0);
%! assert(c(2).channel, 2);
%! assert(c(2).note, 60);
%! assert(c(2).velocity, 10);

%!test
%! a = midimsg("metaevent", 1, "hello");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type == "MetaEvent");
%! assert(a.metatype, 1);
%! assert(a.metadata, uint8([0x68 0x65 0x6C 0x6C 0x6F]));
%! assert(a.msgbytes, uint8([0xFF 0x01 0x05 0x68 0x65 0x6C 0x6C 0x6F]))

%!test
%! # basic assign operations
%!
%! a = midimsg("noteon", 1, 60, 127, 0);
%! assert(length(a) == 1);
%! assert(a.type == "NoteOn");
%! assert(a.channel, 1);
%! assert(a.note, 60);
%! assert(a.velocity, 127);
%! assert(a.timestamp, 0);
%!
%! a.timestamp = 10;
%! a.channel = 2;
%! a.note = 61;
%! a.velocity = 100;
%! assert(a.timestamp, 10);
%! assert(a.channel, 2);
%! assert(a.note, 61);
%! assert(a.velocity, 100);
%!
%! fail ("a.channel = 0;");
%! fail ("a.note = -1;");
%! fail ("a.velocity = -1;");
%
%! a = midimsg("note", 1, 60, 127, 2);
%! assert(length(a) == 2);
%! assert(a(1).timestamp, 0);
%! assert(a(2).timestamp, 2);
%! assert(a(1).note, 60);
%! assert(a(2).note, 60);
%! assert(a(1).channel, 1);
%! assert(a(2).channel, 1);
%!
%! a(1).timestamp = 10;
%! a(2).timestamp = 20;
%! fail ("a(3).timestamp = 1;");
%! a(1).channel = 11;
%! a(2).channel = 12;
%! a(1).note = 71;
%!
%! assert(a(1).timestamp, 10);
%! assert(a(2).timestamp, 20);
%! assert(a(1).channel, 11);
%! assert(a(2).channel, 12);
%! assert(a(1).note, 71);
%!
%! fail ("a(1) = 1;");
%! a(1) = midimsg("noteon", 1, 80, 100, 50);
%! assert(length(a) == 2);
%! assert(a(1).timestamp, 50);
%! assert(a(1).channel, 1);
%! assert(a(1).note, 80);
%! assert(a(1).velocity, 100);
%!
%! # 2nd index still same as was
%! assert(a(2).timestamp, 20);
%! assert(a(2).channel, 12);
%! assert(a(2).note, 60);

