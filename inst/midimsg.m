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
## @deftypefn {} {@var{msg} =} midimsg (0)
## @deftypefnx {} {@var{msg} =} midimsg (@var{type} ....)
## @deftypefnx {} {@var{msg} =} midimsg ("note", @var{channel}, @var{note}, @var{velocity}, @var{duration}, @var{timestamp})
## @deftypefnx {} {@var{msg} =} midimsg ("noteon", @var{channel}, @var{note}, @var{velocity}, @var{timestamp})
## @deftypefnx {} {@var{msg} =} midimsg ("noteoff", @var{channel}, @var{note}, @var{velocity}, @var{timestamp})
## @deftypefnx {} {@var{msg} =} midimsg ("programchange", @var{channel}, @var{prog}, @var{timestamp})
## @deftypefnx {} {@var{msg} =} midimsg ("controlchange", @var{channel}, @var{ccnum}, @var{ccval}, @var{timestamp})
## @deftypefnx {} {@var{msg} =} midimsg ("polykeypressure", @var{channel}, @var{note}, @var{keypressure}, @var{timestamp})
## @deftypefnx {} {@var{msg} =} midimsg ("channelpressure", @var{channel}, @var{chanpressure}, @var{timestamp})
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
## Otherwise the first variable if the type of message to create, followed by the additional parameters for the message.
##
## For each message type, the timestamp value if optional.
##
## @subsubheading Inputs
## @var{type} - string message type.@*
## @var{timestamp} - optional seconds time stamp for the event@*
## @var{channel} - the channel to use for the message (1..16)@*
## @var{note} - the value of the note to play/stop@*
## @var{velocity} - the velocity value for a note on/off, with 0 stopping a note from sounding.@*
## @var{duration} - seconds between starting and stopping a note when created a 'note' message.@*
## @var{prog} - program number when doing a program change message.@*
## @var{ccnum} - control change control number.@*
## @var{ccval} - control change control value.@*
## @var{keypressure} - key pressure value when creating a key pressure message.@*
## @var{chanpressure} - channel pressure value when creating a chanpressure message.@*
## @var{pitchchange} - pitch change value when creating a pitch change message.@*
## @var{monochannels} - channels specified for a mono on message.@*
## @var{bytes} - array of data in range of 0 to 127 specified as part of a data message or system exclusive message.@*
## @var{song} - song selection number for a song selection message.@*
## @var{songposition} - song position value for a song position message.@*
## @var{timeseq} - timecode sequence number for a miditimecodequarterframe message.@*
## @var{timevalue} - timecode value number for a miditimecodequarterframe message.@*
##
## @subsubheading Outputs
## @var{msg} - a midimsg object containing the midi data of the message
##
## @subsubheading Examples
## Create a note on/off pair with a duration of 1.5 seconds
## @example
## @code {
## msg = midimsg('note', 1, 60, 100, 1.5)
## }
## @end example
##
## Create a separate note on/off pair with a time between them of 1.5 seconds
## @example
## @code {
## msg = [midimsg('noteon', 1, 60, 100, 0), midimsg('noteoff', 1, 60, 0, 1.5)]
## }
## @end example
##
## Create a system reset message
## @example
## @code {
## msg = midimsg('systemreset')
## }
## @end example
##
## @seealso{midifileread, midisend, midireceive}
## @end deftypefn

classdef midimsg
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

      if nargin < 1 || (! ischar (typev) && !isscalar (typev))
        error ("Expected midi type or size");
      endif
      if isscalar (typev)
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
          note = varargin{2};
          vel = varargin{3};
          timestamp = 0;
          if nargin > 4
            timestamp = varargin{4};
          endif
          this.data{end+1} = uint8 ([bitor(0x90, chan), note, vel]);
          this.timestamp{end+1} = timestamp;
        case "noteoff"
          # channel,note,velocity,timestamp
          if nargin < 4
            error ('noteoff expects at least channel,note,velocity')
          endif
          chan = this.check_channel(varargin{1})-1;
          note = varargin{2};
          vel = varargin{3};
          timestamp = 0;
          if nargin > 4
            timestamp = varargin{4};
          endif
          this.data{end+1} = uint8 ([bitor(0x80, chan), note, vel]);
          this.timestamp{end+1} = timestamp;
        case "note"
          # channel,note,velocity,duration, timestamp
          if nargin < 5
            error ('note expects at least channel,note,velocity,duration')
          endif
          chan = this.check_channel(varargin{1})-1;
          note = varargin{2};
          vel = varargin{3};
          dur = varargin{4};
          timestamp = 0;
          if nargin > 5
            timestamp = varargin{5};
          endif
          this.data{end+1} = uint8 ([bitor(0x90, chan), note, vel]);
          this.timestamp{end+1} = timestamp;

          timestamp = timestamp + dur;
          this.data{end+1} = uint8 ([bitor(0x90, chan), note, 0]);
          this.timestamp{end+1} = timestamp;
        case "programchange"
          # channel,prog, timestamp
          if nargin < 3
            error ('programchange expects at least channel,note,velocity')
          endif
          chan = this.check_channel(varargin{1})-1;
          prog = varargin{2};
          timestamp = 0;
          if nargin > 3
            timestamp = varargin{3};
          endif
          this.data{end+1} = uint8([bitor(0xc0, chan), prog]);
          this.timestamp{end+1} = timestamp;

        case "controlchange"
          # channel,ccnum, ccval,timestamp
          if nargin < 4
            error ('controlchange expects at least channel,ccnum,ccval')
          endif
          chan = this.check_channel(varargin{1})-1;
          ccnum = varargin{2};
          ccval = varargin{3};
          timestamp = 0;
          if nargin > 4
            timestamp = varargin{4};
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), ccnum ccval]);
          this.timestamp{end+1} = timestamp;

        case "polykeypressure"
          # channel, note, pressure, timestamp
          if nargin < 4
            error ('polykeypressure expects at least channel,note,keypressure')
          endif
          chan = this.check_channel(varargin{1})-1;
          note = varargin{2};
          pres = varargin{3};
          timestamp = 0;
          if nargin > 4
            timestamp = varargin{4};
          endif
          this.data{end+1} = uint8([bitor(0xa0, chan), note pres]);
          this.timestamp{end+1} = timestamp;

        case "channelpressure"
          # channel, pressure, timestamp
          if nargin < 3
            error ('channelpressure expects at least channel,keypressure')
          endif
          chan = this.check_channel(varargin{1})-1;
          pres = varargin{2};
          timestamp = 0;
          if nargin > 3
            timestamp = varargin{3};
          endif
          this.data{end+1} = uint8([bitor(0xd0, chan), pres]);
          this.timestamp{end+1} = timestamp;

        case "pitchbend"
          # channel, pitchchange, timestamp
          if nargin < 3
            error ('channelpressure expects at least channel,pitch')
          endif
          chan = this.check_channel(varargin{1})-1;
          pitch = uint16(varargin{2} + 0x2000);
          pitchlo = bitand(pitch, 0x7F);
          pitchhi = bitand(bitshift(pitch, -7), 0x7f);
          timestamp = 0;
          if nargin > 3
            timestamp = varargin{3};
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
            timestamp = varargin{2};
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 127]);
          this.timestamp{end+1} = timestamp;

        case "monoon"
          # channel,  monochan, timestamp
          if nargin < 3
            error ('monoon expects at least channel and monochannels')
          endif
          chan = this.check_channel(varargin{1})-1;
          mono = varargin{2};
          timestamp = 0;
          if nargin > 3
            timestamp = varargin{3};
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
            timestamp = varargin{2};
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
            timestamp = varargin{2};
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
            timestamp = varargin{2};
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
            timestamp = varargin{2};
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
            timestamp = varargin{2};
          endif
          this.data{end+1} = uint8([bitor(0xb0, chan), 121]);
          this.timestamp{end+1} = timestamp;

        case "songselect"
          if nargin < 2
            error ('songselect expects at least song number')
          endif
          timestamp = 0;
          song = varargin{1};
          if nargin > 2
            timestamp = varargin{2};
          endif
          this.data{end+1} = uint8([0xF3 song]);
          this.timestamp{end+1} = timestamp;

        case "songpositionpointer"
          if nargin < 2
            error ('song expects at least song position')
          endif
          timestamp = 0;
          songpos = uint16(varargin{1});
          songlo = bitand(songpos, 0x7F);
          songhi = bitand(bitshift(songpos, -7), 0x7f);
          if nargin > 2
            timestamp = varargin{2};
          endif
          this.data{end+1} = uint8([0xF2 songlo songhi]);
          this.timestamp{end+1} = timestamp;

        case "miditimecodequarterframe"
          # channel,  monochan, timestamp
          if nargin < 3
            error ('miditimecodequarterframe expects at least seq and value')
          endif
          seq = bitand(uint8(varargin{1}), 3);
          val = bitand(uint8(varargin{2}), 7);
          data = bitshift(seq, 3) + val;
          timestamp = 0;
          if nargin > 3
            timestamp = varargin{3};
          endif
          this.data{end+1} = uint8([0xF1 data]);
          this.timestamp{end+1} = timestamp;

        case "start"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
          endif
          this.data{end+1} = uint8([0xFA]);
          this.timestamp{end+1} = timestamp;

        case "stop"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
          endif
          this.data{end+1} = uint8([0xFC]);
          this.timestamp{end+1} = timestamp;

        case "continue"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
          endif
          this.data{end+1} = uint8([0xFB]);
          this.timestamp{end+1} = timestamp;

        case "systemreset"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
          endif
          this.data{end+1} = uint8([0xFF]);
          this.timestamp{end+1} = timestamp;

        case "activesensing"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
          endif
          this.data{end+1} = uint8([0xFE]);
          this.timestamp{end+1} = timestamp;

        case "timingclock"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
          endif
          this.data{end+1} = uint8([0xF8]);
          this.timestamp{end+1} = timestamp;

        case "tunerequest"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
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
            timestamp = varargin{2};
          endif
          this.data{end+1} = uint8(varargin{1});
          this.timestamp{end+1} = timestamp;

        case "eox"
          timestamp = 0;
          if nargin > 1
            timestamp = varargin{1};
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
              timestamp = varargin{1};
            endif
          elseif nargin == 3
            data = uint8(varargin{1});
            timestamp = varargin{2};
          else
            error ("systemexclusive expects optional data and timestamp only");
          endif

          this.data{end+1} = uint8([0xF0]);
          this.timestamp{end+1} = timestamp;

          # want to build a full SOX data EOX
          if !isempty(data)
            this.data{end+1} = data;;
            this.timestamp{end+1} = timestamp;

            this.data{end+1} = uint8([0xF7]);
            this.timestamp{end+1} = timestamp;
          endif

        otherwise
          error ("Unknown midi type '%s", typev);
      endswitch
       
    endfunction

    function a = horzcat (a, b)
      if !isa(a, 'midimsg') || !isa(b, 'midimsg')
        error ("Cannot concatenate non midimsg elements");
      endif
      for i=1:length (b.data)
        a.data{end+1} = b.data{i};
        a.timestamp{end+1} = b.timestamp{i};
      endfor
    endfunction

    function e = isempty (this)
      e = isempty(this.data);
    endfunction

    function e = length (this)
      e = length(this.data);
    endfunction

    function val = subsref (p, s)
      if isempty(s)
        error ("midimsg.subsref missing index");
      endif

      switch (s(1).type)
        case "()"
          idx = s(1).subs;
          if (numel (idx) != 1)
            error ("@midimsg/subsref: need exactly one index");
          endif
          val = midimsg.createMessage(p.data{idx{1}}, p.timestamp{idx{1}});
        case "."
          switch tolower(s(1).subs)
          case "timestamp"
            if length(p.timestamp) == 1
              val = p.timestamp{1};
            else
              val = p.timestamp;
            endif
          case "msgbytes"
            if length(p.data) == 1
              val = p.data{1};
            else
              val = p.data;
            endif
          case "nummsgbytes"
            if length(p.data) > 0
              val = length(p.data{1});

              if length(p.data) > 1
                for i = 2:length(p.data)
                  val = [val length(p.data{i})];
                endfor
              endif
            else
              val = 0;
            endif
          case "type"
            if length(p.data) > 0
              data = p.data{1};
              val = p.type_str(p.data{1}); 
              if length(p.data) > 1
                val = {val}; 
                for i = 2:length(p.data)
                  val{end+1} = p.type_str(p.data{i});
                endfor
              endif
            else
              val = "<none>"
            endif
          case "channel"
            if length(p.data) > 0
              data = p.data{1};
              val = bitand(data(1), 0x0F) + 1;
              if length(p.data) > 1
                for i = 2:length(p.data)
                  data = p.data{i};
                  val = [val (bitand(data(1), 0x0F)+1)];
                endfor
              endif
              val = double(val);
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

    function short_disp (this)
      printf("MIDI Msg\n");
    endfunction

    function display (this)
      printf("MIDI message:\n");
      # 2 options here
      # single array of data
      # or a cell contain multiple arrays
      for i=1:length(this.data)
         data =  this.data{i};
         cmd = data(1);
         types = this.type_str(data); 

         if bitand(cmd, 0xF0) != 0xF0 && bitand(cmd, 0x80) != 0
           chan = bitand(cmd, 0x0F) + 1;
           printf (" %-10s Channel: %2d", types, chan);
         else
           printf (" %-10s", types);
         endif

         if strcmp(types, "NoteOn") || strcmp(types, "NoteOff")
           printf (" Note: %3d Velocity: %3d", data(2), data(3));
         endif
         if strcmp(types, "ProgramChange")
           printf (" Program: %3d", data(2));
         endif
         if strcmp(types, "ControlChange")
           printf (" CCNumber: %3d CCValue: %3d", data(2), data(3));
         endif
         if strcmp(types, "PitchBend")
           v = bitshift(int16(data(3)), 7) + int16(data(2)) - 0x2000;
           printf (" PitchChange: %d", v);
         endif
         if strcmp(types, "ChannelPressure")
           printf (" ChannelPressure: %3d", data(2));
         endif
         if strcmp(types, "PolyKeyPressure")
           printf (" Note: %3d KeyPressure: %3d", data(2), data(3));
         endif
         if strcmp(types, "LocalControl")
           printf (" LocalControl: %3d", data(3));
         endif
         if strcmp(types, "MonoOn")
           printf (" MonoChannels: %3d", data(3));
         endif
         if strcmp(types, "SongSelect")
           printf (" Song: %3d", data(2));
         endif
         if strcmp(types, "SongPositionPointer")
           v = bitshift(int16(data(3)), 7) + int16(data(2));
           printf (" SongPosition: %d", v);
         endif
         if strcmp(types, "MIDITimeCodeQuarterFrame")
           seq = bitshift(data(2), 3);
           val = bitand(data(2), 7);
           printf (" TimeCodeSequence: %d TimeCodeValue: %d", seq, val);
         endif

         printf (" Timestamp: %f", this.timestamp{i});
         printf (" [");
         printf (" 0x%02X", data);
         printf(" ]\n");
      endfor
    endfunction
    
    function d = uint8 (this)
      d = this.data;
    endfunction

  endmethods

  methods (Access = private)
    function c = check_channel(this, chan)
      if !isscalar (chan) || chan < 1 || chan > 16
        error ("expected channel to be a number between 1..16");
      endif
      c = chan;
    endfunction

    function v = type_str (this, data)
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
         v = "NoteOff";             
       case 0x90
         v = "NoteOn";
       case 0xA0
         v = "PolyKeyPressure";
       case 0xB0
         # depends on next byte for actual msg
         if b1 == 120
           v = "AllSoundOff";
         elseif b1 == 121
           v = "ResetAllControllers";
         elseif b1 == 122
           v = "LocalControl"; # off or on
         elseif b1 == 123
           v = "AllNotesOff";
         elseif b1 == 124
           v = "OmniOff";
         elseif b1 == 125
           v = "OmniOn";
         elseif b1 == 126
           v = "MonoOn";
         elseif b1 == 127
           v = "PolyOn";
         else
           v = "ControlChange";
         endif
       case 0xC0
         v = "ProgramChange";             
       case 0xD0
         v = "ChannelPressure";             
       case 0xE0
         v = "PitchBend";             
       case 0xF0
         if cmd == 0xF0
           v = "SystemExclusive";
         elseif cmd == 0xF1
           v = "MIDITimeCodeQuarterFrame";
         elseif cmd == 0xF2
           v = "SongPositionPointer";
         elseif cmd == 0xF3
           v = "SongSelect";
         elseif cmd == 0xF4
           v = "Reserved";
         elseif cmd == 0xF5
           v = "Reserved";
         elseif cmd == 0xF6
           v = "TuneRequest";
         elseif cmd == 0xF7
           v = "EOX";
         elseif cmd == 0xF8
           v = "TimingClock";
         elseif cmd == 0xF9
           v = "Reserved";
         elseif cmd == 0xFA
           v = "Start";
         elseif cmd == 0xFB
           v = "Continue";
         elseif cmd == 0xFC
           v = "Stop";
         elseif cmd == 0xFD
           v = "Reserved";
         elseif cmd == 0xFE
           v = "ActiveSensing";
         elseif cmd == 0xFF
           v = "SystemReset";
         endif
         # depend  on other bytes ?
       otherwise
         v = "Data";             
      endswitch
      
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

endclassdef

%!fail midimsg('badtype')

%!fail midimsg

%!test
%! a = midimsg(0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 0);
%! assert(isempty(a));

%! fail midimsg("note", 0, 60, 127, 2)

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
%! assert(a.type, "NoteOn");
%! assert(a.channel, 1);
%! assert(a.msgbytes, uint8([0x90 0x3C 0x14]));
%! assert(!isempty(a));
%! a = midimsg("noteon", 2, 60, 20);
%! assert(a.channel, 2);
%! assert(a.msgbytes, uint8([0x91 0x3C 0x14]));

%!test
%! a = midimsg("noteoff", 1, 60, 20);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "NoteOff");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0x80 0x3C 0x14]));

%!test
%! a = midimsg("programchange", 1, 60);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "ProgramChange");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("controlchange", 1, 60, 65);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "ControlChange");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));

%!test
%! a = midimsg("polykeypressure", 1, 60, 65);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "PolyKeyPressure");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));

%!test
%! a = midimsg("pitchbend", 1, 0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "PitchBend");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xE0 0x00 0x40]));

%!test
%! a = midimsg("channelpressure", 1, 60);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "ChannelPressure");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("polyon", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "PolyOn");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("monoon", 1, 0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "MonoOn");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));

%!test
%! a = midimsg("omnion", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "OmniOn");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("omnioff", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "OmniOff");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("allsoundoff", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "AllSoundOff");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("allnotesoff", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "AllNotesOff");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("resetallcontrollers", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "ResetAllControllers");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));

%!test
%! a = midimsg("systemreset");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "SystemReset");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFF]));

%!test
%! a = midimsg("start");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "Start");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFA]));

%!test
%! a = midimsg("stop");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "Stop");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFC]));

%!test
%! a = midimsg("continue");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "Continue");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFB]));

%!test
%! a = midimsg("activesensing");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "ActiveSensing");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xFE]));

%!test
%! a = midimsg("timingclock");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "TimingClock");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF8]));

%!test
%! a = midimsg("eox");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "EOX");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF7]));

%!test
%! a = midimsg("data", [1 2 3]);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "Data");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([1 2 3]));

%!test
%! a = midimsg("songselect", 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "SongSelect");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF3 1]));

%!test
%! a = midimsg("songpositionpointer", 0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "SongPositionPointer");
%! assert(a.nummsgbytes, 3);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF2 0 0]));

%!test
%! a = midimsg("tunerequest");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "TuneRequest");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF6]));

%!test
%! a = midimsg("miditimecodequarterframe", 1, 1);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "MIDITimeCodeQuarterFrame");
%! assert(a.nummsgbytes, 2);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF1 9]));

%!test
%! a = midimsg("systemexclusive");
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "SystemExclusive");
%! assert(a.nummsgbytes, 1);
%! assert(!isempty(a));
%! assert(a.msgbytes, uint8([0xF0]));
%!
%! a = midimsg("systemexclusive", 1.0);
%! assert(isa(a, "midimsg"));
%! assert(length(a) == 1);
%! assert(a.type, "SystemExclusive");
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
%! assert(a.type, "NoteOn");
%! b = midimsg("noteoff", 2, 60, 20, 5.0);
%! assert(isa(b, "midimsg"));
%! assert(length(b) == 1);
%! assert(b.type, "NoteOff");
%! c = [a b];
%! assert(isa(c, "midimsg"));
%! assert(length(c) == 2);
%! assert(c.nummsgbytes, [3 3]);
%! assert(c.channel, [1 2]);
%! assert(c(1).type, "NoteOn");
%! assert(c(1).channel, 1);
%! assert(c(2).type, "NoteOff");
%! assert(c(2).timestamp, 5.0);
%! assert(c(2).channel, 2);
