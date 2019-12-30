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
## @deftypefn {} {@var{dev} =} mididevice (@var{mididev})
## @deftypefnx {} {@var{dev} =} mididevice (@var{mididir}, @var{mididev})
## @deftypefnx {} {@var{dev} =} mididevice ("input", @var{midiindev}, "output", @var{midioutdev})
## Create a midi device using the input parameters.
##
## When a single device name or id is provided, attempt to create the midi device using the same name for both input and output.
##
## Otherwise, use the name or device id for the given input or output direction.
##
## @subsubheading Inputs
## @var{mididev} - name or id of device to load.@*
## @var{mididir} - midi direction of "input" or "output"@*
## @var{midiindev} - midi input name or id@*
## @var{midioutdev} - midi output name or id
##
## @subsubheading Outputs
## @var{dev} - octave_midi class for opened device
##
## @subsubheading Properties
## @var{Input} - Input device name (read only).@*
## @var{Output} - Output device name (read only).@*
## @var{InputID} - Input device id (read only).@*
## @var{OutputID} - Output device id (read only).@*
##
## @subsubheading Examples
## Open midi device with ID of 0.
## @example
## @command{>} dev = mididevice(0);
##
##  mididevice connected to
##    input: "SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0" (1)
##    output: "SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0" (0)
## @end example
##
## Open a named midi device:
## @example
## @command{>} dev = mididevice("SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0");
##
##  mididevice connected to
##    input: "SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0" (1)
##    output: "SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0" (0)
## @end example
##
## @seealso{mididevinfo}
## @end deftypefn

function dev = mididevice (varargin)

  inname = "";
  outname = "";

  if nargin != 1 && nargin != 2 && nargin != 4
    error ("Expected device name, or device type/value pair");
  endif

  # dev list
  devs = __mididevinfo__ ();

  if nargin == 1
    if isscalar (varargin{1})
      name = devs (varargin{1}+1).Name;
    elseif ischar (varargin{1})
      name = varargin{1};
    endif

    # get in and out info

    idx = find (arrayfun(@(x) match_name_and_type(x, name, "input"), devs), 1);
    if !isempty (idx)
      indev = devs (idx);
      inname = indev.Name;
    endif

    idx = find (arrayfun(@(x) match_name_and_type(x, name,"output"), devs), 1);
    if !isempty (idx)
      outdev = devs (idx);
      outname = outdev.Name;
    endif

  elseif nargin == 2
    # type device (input, output)
    # dev num or name

    if isscalar (varargin{2})
      name = devs (varargin{2}+1).Name;
    elseif ischar (varargin{2})
      name = varargin{2};
    endif

    inname = "";
    outname = "";
    if strcmpi (varargin{1}, "input")
      inname = name;
    elseif strcmpi (varargin{1}, "output")
      outname = name;
    else
      error ("expected input or output");
    endif

    if !isempty(inname)
      idx = find (arrayfun(@(x) match_name_and_type(x, name,"input"), devs), 1);
      if !isempty (idx)
        indev = devs (idx);
        inname = indev.Name;
      else
        error ("unknown name %s", inname);
      endif
    endif 

    if !isempty(outname)
      idx = find (arrayfun(@(x) match_name_and_type(x, name,"output"), devs), 1);
      if !isempty (idx)
        outdev = devs (idx);
        outname = outdev.Name;
      else
        error ("unknown name %s", outname);
      endif
    endif 

  else # nargin == 4 
    # an input and output device specified

    if isscalar (varargin{2})
      name = devs (varargin{2}+1).Name;
    elseif ischar (varargin{2})
      name = varargin{2};
    endif

    if strcmpi (varargin{1}, "input")
      inname = name;
    elseif strcmpi (varargin{1}, "output")
      outname = name;
    else
      error ("expected input or output");
    endif

    if isscalar (varargin{4})
      name = devs (varargin{4}+1).Name;
    elseif ischar (varargin{4})
      name = varargin{4};
    endif

    if strcmpi (varargin{3}, "input")
      inname = name;
    elseif strcmpi (varargin{3}, "output")
      outname = name;
    else
      error ("expected input or output");
    endif

    idx = find (arrayfun(@(x) match_name_and_type(x, outname,"output"), devs), 1);
    if !isempty (idx)
        outdev = devs (idx);
        outname = outdev.Name;
    else
      error ("unknown name %s", outname);
    endif

    idx = find (arrayfun(@(x) match_name_and_type(x, inname,"input"), devs), 1);
    if !isempty (idx)
        indev = devs(idx);
        inname = indev.Name;
    else
      error ("unknown name %s", inname);
    endif

  endif

  dev = __mididevice__ (inname, outname);
endfunction

function t = match_name_and_type(x, name, type)
  t = (strncmpi(x.Name, name, length(name)) && strcmpi(x.Direction,type));
endfunction

%!test
%! a = mididevice(0);
%! assert(isa(a, "octave_midi"));

