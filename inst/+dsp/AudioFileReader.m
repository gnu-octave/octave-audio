## Copyright (C) 2026 John Donoghue <john.donoghue@ieee.org>
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

classdef AudioFileReader < handle
  ## -*- texinfo -*- 
  ## @deftypefn {} {} dsp.AudioFileReader
  ## Read audio samples from a audio file
  ## @end deftypefn
  ##
  ## @deftypefn {} {@var{obj} =} AudioFileReader ()
  ## @deftypefnx {} {@var{obj} =} AudioFileReader (@var{filename})
  ## @deftypefnx {} {@var{obj} =} AudioFileReader (@var{propertyname}, @var{propertyvalue} @dots{})
  ## Create a AudioFileReader object
  ##
  ## @subsubheading Inputs
  ## @var{filename} - filename to read@*
  ## @var{propertyname}, @var{propertyvalue} - properties to set on the object.
  ##
  ## @subsubheading Properties
  ## Known creation properties are:
  ## @table @asis
  ## @item Filename
  ## Filename to load data from.
  ## @item OutputDataType
  ## Output data type of 'single' or 'double' (default 'double')
  ## @item SamplesPerFrame
  ## Samples per frame as returned from () (default 1024)
  ## @item PlayCount
  ## Number of times to play the file (default 1)
  ## @item ReadRange
  ## Vector start, stop range of the samples within the file (default [1  Inf])
  ## @end table
  ##
  ## Read-only properties accessable after file is loaded:
  ## @table @asis
  ## @item SampleRate
  ## sample rate of the data
  ## @item NumChannels
  ## Number of channels in the data
  ## @item TotalSamples
  ## Number of samples in the data
  ## @item TotalDuration
  ## Approximate time of the data during playback
  ## @end table
  ##
  ## @subsubheading Outputs
  ## @var{obj} - AudioFileReader object
  ##
  ## @subsubheading Examples
  ## Create a audio reader for reading in a sample file, and then extract each from ntil the file is
  ## completed.
  ## @example
  ## afr = dsp.AudioFileReader("sample.wav")
  ## while ! isDone(afr)
  ##   data = afr();
  ## endwhile
  ## @end example
  ##
  ## Read in a file using 4096 frames, file playes twice.
  ## @example
  ## afr = dsp.AudioFileReader("Filename", "sample.wav", "SamplesPerFrame", 4096, "PlayCount", 2)
  ## while ! isDone(afr)
  ##   data = afr();
  ## endwhile
  ## @end example
  ## @end deftypefn
  ##
  ## @deftypefn {} {[@var{data}. @var{iseof}] =} @var{obj}()
  ## Generate a frame of waveform data from the generator function,
  ## iseof will be true if the end of file was reached at any point during reading the frame.
  ##
  ## @subsubheading Inputs
  ## @var{obj} - AudioFileReader object
  ##
  ## @subsubheading Outputs
  ## @var{data} - waveform data
  ## @end deftypefn
  ##
  ## @deftypefn {} {} release(@var{obj})
  ## Release resources of generator
  ##
  ## @subsubheading Inputs
  ## @var{obj} - AudioFileReader object
  ##
  ## @subsubheading Outputs
  ## None
  ## @end deftypefn
  ##
  ## @deftypefn {} {@var{tf} = } isDone(@var{obj})
  ## Return status of iterating the data.
  ##
  ## @subsubheading Inputs
  ## @var{obj} - AudioFileReader object
  ##
  ## @subsubheading Outputs
  ## @var{tf} -  true if at end of file and data has been iterated playcount times
  ## @end deftypefn

  properties (Access = private, Hidden = true)
    _wavedata = struct("data", [], "info", {});
    _rundata = struct("is_done",false, "play_count", 0, "pos", 0);
    file = [];
  endproperties

  properties (Access = public)
    Filename = [];
    PlayCount = 1;
    SamplesPerFrame = 1024;
    OutputDataType = "double";
  endproperties

  properties (SetAccess = private)
    # Read Only
    SampleRate = -1;
    NumChannels = 1;
    TotalSamples=  0;
    TotalDuration = 0;

    ReadRange = [1 Inf];
  endproperties

  properties (Static = true, Access = private)
    check_filename_value = @(x) ischar(x);
    check_odt_value = @(x) ischar(x) && any (strcmp (x, {'single', 'double', 'int16', 'uint8'}));
    check_playcount_value = @(x) isnumeric(x) && isscalar(x) && x > 0;
    check_spf_value = @(x) isnumeric(x) && isscalar(x) && (rem(x, 1) == 0) && (x > 0);
    check_readrange_value = @(x) isvector(x) && isreal(x) && size(x) == [1 2];
  endproperties

  methods (Access = public)
    function this = AudioFileReader(varargin)
      # parse args
      if nargin == 1
        if ! this.check_filename_value(varargin{1})
          error ("Expected filename as string");
        endif
        this.Filename = varargin{1};
      elseif nargin > 1
        # properties instead ?
        p = inputParser(CaseSensitive=false, FunctionName='dsp.AudioFileReader');
        p.addParameter('OutputDataType', this.OutputDataType, this.check_odt_value);
        p.addParameter('PlayCount', this.PlayCount, this.check_playcount_value);
        p.addParameter('Filename', this.Filename, this.check_filename_value);
        p.addParameter('ReadRange', this.ReadRange, this.check_readrange_value);
        p.addParameter('SamplesPerFrame', this.SamplesPerFrame, this.check_spf_value);

        p.parse(varargin{:})

	if isempty (p.Results.Filename)
          error ("Expected Filename to be specified  input property");
	endif
	this.Filename = p.Results.Filename;
	this.PlayCount = fix(p.Results.PlayCount);
	this.OutputDataType = p.Results.OutputDataType;
	this.ReadRange = p.Results.ReadRange;
	this.SamplesPerFrame = p.Results.SamplesPerFrame;
      endif

      this._init_data();
    endfunction

    function infodata = info (this)
      infodata = {};
      infodata.SampleRate = this._wavedata.info.SampleRate;
      infodata.NumBits = this._wavedata.info.BitsPerSample;
      infodata.TotalSamples = this._wavedata.info.TotalSamples;
      infodata.Duration = (this._wavedata.info.TotalSamples / this._wavedata.info.SampleRate);
      infodata.NumChannels = this._wavedata.info.NumChannels;
    endfunction

    function tf = isDone (this)
      tf = this._rundata.is_done;
    endfunction

    function [y, eof] = step (this, cnt)
      if nargin < 2
        cnt = 1;
      endif

      y = [];
      eof = 0;

      if this._rundata.is_done
        return;
      endif

      while cnt > 0
        cnt = cnt - 1;
        eof = 0;

        # extract some of the sample
        y = [];
        len = this.SamplesPerFrame - length(y);
        while len > 0
           left = length(this._wavedata.data) - this._rundata.pos;
           if left <= len
             # use up all thats left
             y = [y; this._scale(this._wavedata.data(this._rundata.pos+1:end))];
             this._rundata.pos = 0;
	     eof = 1;
	     # continue again ?
	     this._rundata.play_count = this._rundata.play_count + 1;
	     if this._rundata.play_count >= this.PlayCount
	       this._rundata.is_done = true;
               return
	     endif
           else
             y = [y; this._scale(this._wavedata.data(this._rundata.pos+1:this._rundata.pos+len))];
             this._rundata.pos = this._rundata.pos + len;
           endif

           len = this.SamplesPerFrame - length(y);
        endwhile

      endwhile

    endfunction

    function release (this)
      this._wavedata.data = [];
    endfunction

    function reset (this)
      this._rundata.is_done = false;
      this._rundata.pos = 0;
    endfunction

    function varargout = subsref(this, S)
      if nargin == 1 || (S(1).type == "()" && isempty(S(1).subs))
        # ofr ()
	S = S(2:end);
	[y,  eof] = step(this, 1);
	varargout{1} = y;
	varargout{2} = eof;
	return;
      endif
      varargout{1} = builtin('subsref',this, S);
    endfunction

    function this = set.PlayCount (this, data)
      if ! this.check_playcount_value(data)
        error ("Expected PlayCOunt value as positive numeric");
      endif
      this.PlayCount = fix(data);
    endfunction

    function this = set.Filename (this, data)
      if ! this.check_filename_value(data)
        error ("Expected Filename value as string");
      endif
      if !strcmp(this.Filename, data)
        this.Filename = data;
	this._init_data();
      endif
    endfunction

    function this = set.OutputDataType (this, data)
      if ! this.check_odt_value(data)
        error ("Expected OutputDataType value as positive 'double', 'single', 'int16' or 'uint8'");
      endif
      this.OutputDataType = data;
    endfunction
 
    function this = set.SamplesPerFrame (this, data)
      if ! this.check_spf_value(data)
        error ("Expected SamplesPerFrame value as positive number");
      endif
      this.SamplesPerFrame = data;
    endfunction
  endmethods

  methods (Access = private)
    function data = _scale(this, data)
      if strcmp(this.OutputDataType,"int16")
        data = int16(data*32767);
      elseif strcmp(this.OutputDataType,"uint8")
        data = int8((data*127) + 127);
      elseif strcmp(this.OutputDataType,"single")
        data = single(data);
      endif
    endfunction

    function this = _init_data(this)
      if !isempty(this.Filename)
        ainfo = audioinfo(this.Filename);
        [data, sr] = audioread(this.Filename, this.ReadRange, this.OutputDataType);
      else
        ainfo = {};
	data = [];
	sr = -1;
      endif
      ainfo.TotalSamples = rows(data);
      this._wavedata = struct ("data", data, "info", ainfo);
      this._rundata = struct("is_done",false, "play_count", 0, "pos", 0);
      this.SampleRate = sr;
      this.NumChannels = columns(this._wavedata.data);
      this.TotalSamples = rows(this._wavedata.data);
      this.TotalDuration = (this.TotalSamples / sr);
    endfunction
  endmethods
endclassdef

%!test
%! filename = file_in_loadpath("data/sample.wav");
%! ainfo = audioinfo(filename);
%! afr = AudioFileReader;
%! afr.Filename = filename;
%! assert(afr.SamplesPerFrame, 1024);
%! assert(afr.Filename, filename);
%! assert(afr.OutputDataType, "double");
%! assert(afr.PlayCount, 1);
%! assert(afr.ReadRange, [1 Inf]);
%! assert(afr.NumChannels, ainfo.NumChannels);
%! assert(afr.TotalSamples, ainfo.TotalSamples);
%!
%! afr.SamplesPerFrame = 500;
%! assert(afr.SamplesPerFrame, 500);
%! afr.OutputDataType = "uint8";
%! assert(afr.OutputDataType, "uint8");
%! afr.PlayCount = 10;
%! assert(afr.PlayCount, 10);

%!test
%! filename = file_in_loadpath("data/sample.wav");
%! ainfo = audioinfo(filename);
%! afr = AudioFileReader(filename);
%! assert(afr.SamplesPerFrame, 1024);
%! assert(afr.Filename, filename);
%! assert(afr.OutputDataType, "double");
%! assert(afr.PlayCount, 1);
%! assert(afr.ReadRange, [1 Inf]);
%! assert(afr.NumChannels, ainfo.NumChannels);
%! assert(afr.TotalSamples, ainfo.TotalSamples);
%! assert(isDone(afr), false);
%! data = afr();
%! assert(class(data), "double");
%! assert(size(data), [1024 1]);
%! [data,eof] = afr();
%! assert(size(data), [1024 1]);
%! assert(eof, 0);
%! assert(isDone(afr), false);

%!test
%! filename = file_in_loadpath("data/sample.wav");
%! ainfo = audioinfo(filename);
%! afr = AudioFileReader('Filename', filename, 'SamplesPerFrame', 5000, "OutputDataType", "int16", "ReadRange", [1 5100]);
%! assert(afr.SamplesPerFrame, 5000);
%! assert(afr.Filename, filename);
%! assert(afr.OutputDataType, "int16");
%! assert(afr.PlayCount, 1);
%! assert(afr.ReadRange, [1 5100]);
%! assert(afr.NumChannels, ainfo.NumChannels);
%! assert(afr.TotalSamples, 5100);
%! assert(isDone(afr), false);
%! [data, eof] = afr();
%! assert(class(data), "int16");
%! assert(size(data), [5000 1]);
%! assert(eof, 0);
%! assert(isDone(afr), false);
%! [data, eof] = afr();
%! assert(class(data), "int16");
%! assert(size(data), [100 1]);
%! assert(eof, 1);
%! assert(isDone(afr), true);

%!test
%! filename = file_in_loadpath("data/sample.wav");
%! ainfo = audioinfo(filename);
%! afr = AudioFileReader('Filename', filename, 'SamplesPerFrame', 5000, "ReadRange", [1 5100], 'PlayCount', 2);
%! assert(afr.SamplesPerFrame, 5000);
%! assert(afr.Filename, filename);
%! assert(afr.OutputDataType, "double");
%! assert(afr.PlayCount, 2);
%! assert(afr.ReadRange, [1 5100]);
%! assert(afr.NumChannels, ainfo.NumChannels);
%! assert(afr.TotalSamples, 5100);
%! assert(isDone(afr), false);
%! [data, eof] = afr();
%! assert(size(data), [5000 1]);
%! assert(eof, 0);
%! [data, eof] = afr();
%! assert(size(data), [5000 1]);
%! assert(eof, 1);
%! assert(isDone(afr), false);
%! [data, eof] = afr();
%! assert(size(data), [200 1]);
%! assert(eof, 1);
%! assert(isDone(afr), true);
%!
%! reset(afr);
%! assert(isDone(afr), false);
