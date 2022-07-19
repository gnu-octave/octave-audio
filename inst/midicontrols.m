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

classdef midicontrols < handle
  ## -*- texinfo -*- 
  ## @deftypefn {} {@var{obj} =} midicontrols ()
  ## @deftypefnx {} {@var{obj} =} midicontrols (@var{ctrlid})
  ## @deftypefnx {} {@var{obj} =} midicontrols (@var{ctrlid}, @var{initialvalues})
  ## @deftypefnx {} {@var{obj} =} midicontrols (__, @var{propertyname}, @var{propertyvalue})
  ## Create a midi controls object
  ##
  ## @subsubheading Inputs
  ## @var{ctrlid} - single control id or array of control ids to monitor, or [] to use any controller.@*
  ## @var{initialvalues} - initial values to use for controls. It should be the same size as @var{ctrlid}@*
  ## @var{propertyname}, @var{propertyvalue} - properties to set on the controller. If a device is not specified
  ## the value from getpref("midi", "DefaultDevice", 0) will be used.@*
  ##
  ##
  ## Known properties are:
  ## @table @asis
  ## @item mididevice
  ## name of the mididevice to monitor.
  ## @item outputmode
  ## the scaling mode for values: 'rawmidi' will return values between 0 .. 127,
  ## 'normalized' will use values between 0 .. 1.
  ## @end table
  ##
  ## @subsubheading Outputs
  ## @var{obj} - returns a midicontrols object
  ##
  ## @subsubheading Examples
  ## Create a midicontrols object monitoring control id 2001 on the default midi device 
  ## @example
  ## ctrl = midicontrols(2001)
  ## @end example
  ##
  ## Create a midicontrols object monitoring control id 2001 on a a non default device
  ## @example
  ## ctrl = midicontrols(2001, 'mididevice', 1)
  ## @end example
  ##
  ## @seealso{midiread, midisync}
  ## @end deftypefn

  properties (Access = private)
   controls = [];
   initialvalue = 0;
   currentvalue = [];
   device = [];
   outscale = 1;
   midiscale = 127;
  endproperties
 
  methods
    
    function this = midicontrols (varargin)
      devicename = "";

      if nargin > 0
        controls = varargin{1};
        if !isnumeric(controls)
          error ("Expected numeric controls ids");
        endif
        if isscalar(controls)
          this.controls = [controls];
        else
          this.controls = controls;
        endif
      endif

      if nargin > 1
        if ischar (varargin{2})
          propstart = 2;
          initvals = [0];
        else
          propstart = 3;
          initvals = varargin{2};

          if !isnumeric (initvals)
            error ("Expected numeric initial values");
          endif
          if isscalar (initvals)
            initvals = [initvals];
          endif
        endif

        if mod (nargin-propstart + 1, 2) != 0
          error ("midicontrols: expected property name, value pairs");
        endif
        if !iscellstr (varargin (propstart:2:nargin))
          error ("midicontrols: expected property names to be strings");
        endif

        for i = propstart:2:nargin
          propname = tolower (varargin{i});
          propvalue = varargin{i+1};

          if strcmp (propname, "outputmode")
            if !ischar (propvalue)
              error ("output mode should be 'normalized' or 'rawmidi'")
            elseif strcmpi (propvalue, "normalized")
              this.outscale = 1;
            elseif strcmpi (propvalue, "rawmidi")
              this.outscale = 127;
            else
              error ("output mode should be 'normalized' or 'rawmidi'")
            endif
          elseif strcmp (propname, "mididevice")
            devicename = propvalue;
          else
            error ("unknown property '%s'", propname)
          endif
        endfor

        this.initialvalue = initvals/this.outscale;
      endif

      if length (this.controls) > 0
        this.currentvalue = zeros (length(this.controls), 1);
      else
        this.currentvalue = zeros (1, 1);
      endif

      for i = 1:length (this.currentvalue)
        this.currentvalue(i) = this.get_value (i, this.initialvalue);
      endfor

      if isempty(devicename)
        devicename = getpref ("midi", "DefaultDevice", 0);
      endif
      this.device = mididevice (devicename);
    endfunction

    function delete (this)
      try
        this.callback("");
      catch
        # do nothing
      end_try_catch
    endfunction

    function send (this, values)
      if nargin < 2
        values = this.initialvalue;
      else
        if isscalar(values)
          values = [values];
        endif
        values = values/this.outscale;
      endif

      if isempty(this.controls)
        warning ('Can not send control values when no specific controller ids were provided.')
        val = this.get_value(1, values);
        this.currentvalue(1) = val;
      else
        for i =1:length(this.controls)
          ctrl = this.controls(i);
          ch = int32(ctrl/1000);
          id = mod(ctrl, 1000);

          val = this.get_value(i, values);
          this.currentvalue(i) = val;

          midisend(this.device, midimsg("controlchange", ch, id, val*this.midiscale));
        endfor
      endif

    endfunction

    function val = recv(this)
      mx = midireceive(this.device);
      while !isempty(mx)
        for j = 1:length(mx)
          m = mx(j);
          if strcmp(m.type, "ControlChange")
            if isempty(this.controls)
              idx = 1;
            else
              ctrlid = m.channel*1000 + double(m.msgbytes(2));
              idx = find(this.controls==ctrlid, 1);
            endif
            if !isempty(idx)
              val = double(m.msgbytes(3))/this.midiscale;
              this.currentvalue(idx) = val;
            endif
          endif
        endfor
        mx = midireceive(this.device);
      endwhile

      val = zeros(length(this.currentvalue));
      for i = 1:length(this.currentvalue)
        val(i) = this.get_value(i, this.currentvalue)*this.outscale;
      endfor
    endfunction

    function val = callback(this, cb=[])
      # set/unset callback
      if nargin < 2
        val = __midicallback__(this.device);
      else
        if isempty(cb)
          val = __midicallback__(this.device, cb, []);
        else
          val = __midicallback__(this.device, cb, this);
        endif
      endif

      if ischar(val) && isempty(val)
        val = [];
      endif
    endfunction

    function val = get_value(this, ch, values)
      if isscalar(values)
        val = values;
      else
        if i > length(values)
          val = values(i);
        else
          val = 0;
        endif
      endif
      val = double(val);
    endfunction

    function out = disp (this)
      if nargout == 0
        disp(sprintf ("  midicontrols object: listening for events on %s",  this.device.Input));
      else
        out = sprintf ("midicontrols object: listening for events on %s\n",  this.device.Input);
      endif
      if ( isempty(this.controls))
        if nargout == 0
          disp ("    any control"); % any control on {devname}
        else
          out = [out "  any control\n"];
        endif
      else
        if nargout == 0
          disp (["    controls " sprintf("%d ", this.controls)]);
        else
          out = [out "  controls " sprintf("%d ", this.controls) "\n"];
        endif
      endif       
    endfunction
  endmethods
endclassdef

%!test
%! a = midicontrols();
%! assert(isa(a, "midicontrols"));
