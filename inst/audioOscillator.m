## Copyright (C) 2023 John Donoghue <john.donoghue@ieee.org>
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

classdef audioOscillator < handle
  ## -*- texinfo -*- 
  ## @deftypefn {} {} audioOscillator
  ## Generate sine, sawtool and square waveforms
  ## @end deftypefn
  ##
  ## @subheading Methods
  ## @deftypefn {} {@var{obj} =} audioOscillator ()
  ## @deftypefnx {} {@var{obj} =} audioOscillator (@var{signalTypeValue})
  ## @deftypefnx {} {@var{obj} =} audioOscillator (@var{signalTypeValue}, @var{frequencyValue})
  ## @deftypefnx {} {@var{obj} =} audioOscillator (__, @var{propertyname}, @var{propertyvalue})
  ## Create a audioOscillator object
  ##
  ## @subsubheading Inputs
  ## @var{signalTypeValue} - signal type of "sine" (default), "square", "sawtooth".@*
  ## @var{frequencyValue} - hz frequency value of waveform (default 100).@*
  ## @var{propertyname}, @var{propertyvalue} - properties to set on the object. 
  ##
  ## Known properties are:
  ## @table @asis
  ## @item SignalType
  ## signal type of "sine" (default), "square" or "sawtooth". (readonly)
  ## @item Frequency
  ## frequency of the waveform (default 100)
  ## @item Amplitude
  ## amplitude of the signal (default 1)
  ## @item SampleRate
  ## sample rate of the signal (default 44100)
  ## @item PhaseOffset
  ## phase offset of signal 0 (default) - 1 (readonly)
  ## @item DutyCycle
  ## dutycycle of the signal 0 - 1 (default 0.5) when signal is a square wave.
  ## @item SamplePerFrame
  ## Samples per frame as returned from () (default 512)
  ## @item MaxSamplePerFrame
  ## Max samples per frame (default 192000)
  ## @item DCOffset
  ## DC Offset of signal (default 0)
  ## @item Width
  ## Width of sawtooth (default 1)
  ## @item OutputDataType
  ## Output data type of 'single' or 'double' (default 'double')
  ## @end table
  ##
  ## @subsubheading Outputs
  ## @var{obj} - signalGenerator object
  ##
  ## @subsubheading Examples
  ## Create a 100 hz sine wave and plot first 512 samples
  ## @example
  ## sinosc = audioOscillator
  ## data = sinosc();
  ## plot(data);
  ## @end example
  ##
  ## Create a 2 hz square wave with duty cycle of 0.5
  ## @example
  ## sqosc = audioOscillator('square', 'DutyCycle', 0.50,  'Frequency', 2);
  ## @end example
  ##
  ## @end deftypefn
  ##
  ## @deftypefn {} {@var{data} =} @var{obj}()
  ## Generate a frame of waveform data from the generator function
  ##
  ## @subsubheading Inputs
  ## @var{obj} - signalGenerator object
  ##
  ## @subsubheading Outputs
  ## @var{data} - waveform data
  ## @end deftypefn
  ##
  ## @deftypefn {} {} release(@var{obj})
  ## Release resources of generator
  ##
  ## @subsubheading Inputs
  ## @var{obj} - signalGenerator object
  ##
  ## @subsubheading Outputs
  ## None
  ## @end deftypefn


  properties (SetAccess = private, GetAccess = public)
    # read only properties
    SignalType = "sine";
    PhaseOffset = 0;
  endproperties

  properties (Access = public)
    # read/write properties
    SampleRate = 44100;
    DutyCycle = 0.5;
    Frequency = 100;
    Amplitude = 1.0;
    SamplesPerFrame = 512;
    Width = 1;
    DCOffset = 0;
    MaxSamplesPerFrame = 192000;
    OutputDataType = 'double'
  endproperties

  properties (Static = true, Access = private)
    # data validation functions
    check_sig_value = @(x) ischar(x) && any (strcmp (x, {'sine', 'square', 'sawtooth'}));
    check_odt_value = @(x) ischar(x) && any (strcmp (x, {'single', 'double'}));
    check_amp_value = @(x) isnumeric(x) && isreal(x) && (x >= 0)
    check_duty_value = @(x) isnumeric(x) && isreal(x) && isscalar(x) && (x >= 0 && x <= 1)
    check_freq_value = @(x) isnumeric(x) && isreal(x) && (x >= 0)
    check_srate_value = @(x) isnumeric(x) && isscalar(x) && isreal(x) && (x > 0)
    check_spf_value = @(x) isnumeric(x) && isscalar(x) && (rem(x, 1) == 0) && (x > 0)
    check_mspf_value = @(x) isnumeric(x) && isscalar(x) && (rem(x, 1) == 0) && (x > 0)
    check_width_value = @(x) isnumeric(x) && isscalar(x) && (x >= 0 && x <= 1)
    check_dcoff_value = @(x) isnumeric(x) && isreal(x)
    check_phase_value = @(x) isnumeric(x) && isreal(x) && all(x >= 0 && x <= 1)
  endproperties

  properties (Access = private)
    # internal data structure  for waveform
    _wavedata = struct("data", [], "pos", 0);
  endproperties

  methods (Access = public)
    function this = audioOscillator(varargin)
      if nargin > 0
        # either a property name or signal type
        if !ischar(varargin{1})
          error ("Expected first input argument to be signal type or property name.")
        endif

        propstart = 1;
        # do we have signal type or possible property name/value?
        if this.check_sig_value(varargin{1})
          this.SignalType = varargin{1};
          propstart = 2;

          # we have frequency too ?
          if nargin > 1 && isnumeric(varargin{2})
            propstart = 3;
            this.Frequency = varargin{2};
          endif
        elseif !any(strcmpi(varargin{1}, properties(this)))
          error ("Expected first input argument to be signal type or property name.")
        endif

        # handle the properties
        p = inputParser(CaseSensitive=false, FunctionName='audioOscillator');
        p.addParameter('SignalType', this.SignalType, this.check_sig_value);
        p.addParameter('Amplitude', this.Amplitude, this.check_amp_value);
        p.addParameter('DutyCycle', this.DutyCycle, this.check_duty_value);
        p.addParameter('Frequency', this.Frequency, this.check_freq_value);
        p.addParameter('SampleRate', this.SampleRate, this.check_srate_value);
        p.addParameter('SamplesPerFrame', this.SamplesPerFrame, this.check_spf_value);
        p.addParameter('Width', this.Width, this.check_width_value);
        p.addParameter('DCOffset', this.DCOffset, this.check_dcoff_value);
        p.addParameter('MaxSamplesPerFrame', this.MaxSamplesPerFrame, this.check_mspf_value);
        p.addParameter('OutputDataType', this.OutputDataType, this.check_odt_value);
        p.addParameter('PhaseOffset', this.PhaseOffset, this.check_phase_value);
        p.parse(varargin{propstart:end})

        # verify samples per frame vs maxsample per frame
        if p.Results.SamplesPerFrame > p.Results.MaxSamplesPerFrame
          error ("Invalid SamplesPerFrame - Can not be greater than MaxSamplesPerFrame")
        endif
        this.MaxSamplesPerFrame = p.Results.MaxSamplesPerFrame;

        # set properties from inputs/defaults
        fields = fieldnames(p.Results);
        for f = 1:length(fields)
          propname = fields{f};
          propval = p.Results.(propname);
          this.(propname) = propval;
        endfor

      endif
    endfunction

    function release(this)
      # anything we need release ?
      if ! isempty(this._wavedata.data)
        this._wavedata.data = [];
        this._wavedata.pos = 0;
      endif
    endfunction

    function data = subsref(this, S)
      if nargin == 1 || (S(1).type == "()" && isempty(S(1).subs))

        # build the waveform if we dont have one yet
        if isempty(this._wavedata.data)
          this._wavedata.pos = 0;
          
          # phase
          theta = this.PhaseOffset * 2 * pi;

          t = linspace(theta,2*pi*this.Frequency+theta,this.SampleRate);

          if strcmp(this.SignalType, "sine")
            wavedata = sin(t);

          elseif strcmp(this.SignalType, "square")
            t = t / 2*pi;
            wavedata = ones(size(t));
            wavedata(t-floor(t) >= this.DutyCycle) = -1;
          
          elseif strcmp(this.SignalType, "sawtooth")
            t = mod (t / (2 * pi), 1);
            wavedata = zeros (size (t));
            if this.Width != 0
              wavedata(t < this.Width) = 2 * t(t<this.Width) / this.Width -1;
            endif

            if this.Width != 1
              wavedata(t >= this.Width) = -2 * t(t>=this.Width) / (1-this.Width) +1;
            endif

          else
            # should never be able to get here
            error ("Unknown SignalType");
          endif

          wavedata = this.DCOffset + (this.Amplitude * wavedata);

          if strcmp(this.OutputDataType, 'single')
            wavedata = single(wavedata);
          endif

          this._wavedata.data = wavedata;
        endif

        # extract some of the sample
        data = [];
        len = this.SamplesPerFrame - length(data);
        while len > 0
           left = length(this._wavedata.data) - this._wavedata.pos;
           if left <= len
             # use up all thats left
             data = [data this._wavedata.data(this._wavedata.pos+1:end)];
             this._wavedata.pos = 0;
           else
             data = [data this._wavedata.data(this._wavedata.pos+1:this._wavedata.pos+len)];
             this._wavedata.pos = this._wavedata.pos + len;
           endif

           len = this.SamplesPerFrame - length(data);
        endwhile

	S = S(2:end);
      else
        data = this;
      endif

      if (numel (S) > 0)
        data = builtin('subsref',data, S);
      endif
    endfunction

    function this = set.SampleRate(this, rate)
       if ! this.check_srate_value(rate)
         error ("Invalid SampleRate - validation %s", func2str(this.check_srate_value))
       endif
       this.SampleRate = rate;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.DutyCycle(this, rate)
       if ! this.check_duty_value(rate)
         error ("Invalid DutyCycle - validation %s", func2str(this.check_duty_value))
       endif
       this.DutyCycle = rate;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.Amplitude(this, amp)
       if ! this.check_amp_value(amp)
         error ("Invalid Amplitude - validation %s", func2str(this.check_amp_value))
       endif
       this.Amplitude = amp;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.SamplesPerFrame(this, value)
       if ! this.check_spf_value(value)
         error ("Invalid SamplesPerFrame - validation %s", func2str(this.check_spf_value))
       endif
       if value > this.MaxSamplesPerFrame
         error ("Invalid SamplesPerFrame - Can not be greater than MaxSamplesPerFrame");
       endif
       this.SamplesPerFrame = value;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.MaxSamplesPerFrame(this, value)
       if ! this.check_mspf_value(value)
         error ("Invalid MaxSamplesPerFrame - validation %s", func2str(this.check_mspf_value))
       endif
       this.MaxSamplesPerFrame = value;

       # scale back samples per frame if now is invalid
       if this.SamplesPerFrame > value
         this.SamplesPerFrame = value;
       endif
    endfunction

    function this = set.Width(this, value)
       if ! this.check_width_value(value)
         error ("Invalid Width - validation %s", func2str(this.check_width_value))
       endif
       this.Width = value;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.DCOffset(this, value)
       if ! this.check_dcoff_value(value)
         error ("Invalid DCOffset - validation %s", func2str(this.check_dcoff_value))
       endif
       this.DCOffset = value;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.OutputDataType(this, value)
       if ! this.check_odt_value(value)
         error ("Invalid OutputDataType - validation %s", func2str(this.check_odt_value))
       endif
       this.OutputDataType = value;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction

    function this = set.Frequency(this, value)
       if ! this.check_freq_value(value)
         error ("Invalid Frequency - validation %s", func2str(this.check_freq_value))
       endif
       this.Frequency = value;
       # clear data so will be regenerated
       this._wavedata.data = [];
    endfunction


  endmethods
 
endclassdef

%!error audioOscillator(1)
%!error audioOscillator("unknown")
%!error audioOscillator("sine", "a")

%!test
%! osc = audioOscillator();
%! assert(osc.Frequency, 100);
%! assert(osc.SampleRate, 44100);
%! assert(osc.SignalType, "sine");
%! osc = audioOscillator("sine");
%! assert(osc.SignalType, "sine");
%! osc = audioOscillator("SignalType", "sine");
%! assert(osc.SignalType, "sine");
%! osc = audioOscillator("sine", 2);
%! assert(osc.SignalType, "sine");
%! assert(osc.Frequency, 2);

%!test
%! osc = audioOscillator("square");
%! assert(osc.Frequency, 100);
%! assert(osc.SampleRate, 44100);
%! assert(osc.SignalType, "square");
%! osc = audioOscillator("SignalType", "square");
%! assert(osc.SignalType, "square");
%! osc = audioOscillator("square", 2);
%! assert(osc.SignalType, "square");
%! assert(osc.Frequency, 2);

%!test
%! osc = audioOscillator("sawtooth");
%! assert(osc.Frequency, 100);
%! assert(osc.SampleRate, 44100);
%! assert(osc.SignalType, "sawtooth");
%! osc = audioOscillator("SignalType", "sawtooth");
%! assert(osc.SignalType, "sawtooth");

%!test
%! osc = audioOscillator("SignalType", "sine", "Frequency", 2, "Amplitude", 1.1, "SamplesPerFrame", 1024);
%! assert(osc.Frequency, 2);
%! assert(osc.Amplitude, 1.1);
%! assert(osc.SamplesPerFrame, 1024);
%! assert(osc.SampleRate, 44100);

%!test
%! osc = audioOscillator("sine");
%! data = osc();
%! assert(length(data), osc.SamplesPerFrame)

