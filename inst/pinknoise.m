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

## -*- texinfo -*- 
## @deftypefn {} {@var{X} =} pinknoise(@var{n})
## @deftypefnx {} {@var{X} =} pinknoise(@var{sz})
## @deftypefnx {} {@var{X} =} pinknoise(@var{sz1}, @var{sz2})
## @deftypefnx {} {@var{X} =} pinknoise(___, @var{typename})
## @deftypefnx {} {@var{X} =} pinknoise(___, 'like', @var{p})
## Create pinknoise using random numbers through a series of randomly initiated SOS filters..
##
## Note: this function uses zp2sos and sosfilt from the signal package, which will be loaded
## as part of calling this function.
##
## @subsubheading Inputs
## @var{n} - scalar value for length of the pinknoise
##
## @var{sz} - A 2 element vector for [length, number_of_channels]
##
## @var{sz1}, @var{sz2} - scalar length and number of channels.
##
## @var{typename} - datatype to create - 'double' or 'single'.
##
## @var{p} - matrix of data to use class type 'double' or 'single'.
##
## @subsubheading Outputs
## @var{X} - pinknoise output
##
## @subsubheading Examples
## Create 10 second 2 channel pink noise waveform at 44.1kHz
##
## @example
## fs = 44.1e3;
## duration = 10;
## y = pinknoise(duration*fs, 2);
## @end example
##
## @seealso{whitenoise}
## @end deftypefn

function y = pinknoise(varargin)
    if nargin < 1
      print_usage()
    endif

    # Parse and get inputs
    p = inputParser(CaseSensitive=false, FunctionName="pinknoise");
    if nargin > 0 && isvector(varargin{1}) && length(varargin{1}) > 1
      chk = @(x) assert(isvector(x) && length(x) == 2 && all(x > 0), "Expected sz as 2 element positive vector");
      p.addRequired("sz", chk);
    else
      chk = @(x) assert(isscalar (x) && isnumeric(x) && (x >= 1), "Expected sz1 as a positive scalar");
      p.addRequired("sz1", chk);

      # Only adding if we have a arg thats not a char,
      # otherwise will kick into paramters when should still be
      # postional arg input
      if nargin >1 && !ischar(varargin{2})
        chk = @(x) assert((isscalar(x) && isnumeric(x) && (x >= 1)), "Expected sz2 as a positive scalar");
        p.addRequired("sz2", chk);
      endif
    endif
    #chk = @(x) assert(ischar (x) && any(strcmp(x,{"single", "double"})), "Expected typename as 'double' or 'single'");
    chk = @(x) ischar (x) && !strcmp(x, "like");
    p.addOptional("typename", "double", chk);
    chk = @(x) assert(ismatrix(x) && any(strcmp(class(x),{"single", "double"})), "Expected p as a matrix of type 'double' or 'single'");
    p.addParameter("like", [], chk)

    p.parse(varargin{:});

    if any(strcmp("sz", p.Parameters))
      N = p.Results.sz(1);
      C = p.Results.sz(2);
    else
      N = p.Results.sz1;
      if any(strcmp("sz2", p.Parameters))
        C = p.Results.sz2;
      else
        C = 1;
      endif
    endif

    typename = p.Results.typename;
    # check type is actually good
    if !any(strcmp(typename,{"single", "double"}))
      error("Expected typename as 'double' or 'single'")
    endif

    if ! isempty(p.Results.like)
      typename = class(p.Results.like);
    endif

    # We have a dependancy on some signal functions
    # so load if we dont have yet
    if !exist("sosfilt")
      pkg load signal;
    endif

    # Generate uniform white noise of the required size
    white_noise = 2 * rand(N, C) - 1;

    # create pinking filter coefficients for approximation of -3dB/octave [1]
    B = [0.049922035, -0.095993537, 0.050612699, -0.004408786];
    A = [1, -2.494956002, 2.017265875, -0.522189400];
    sos = zp2sos(roots(B), roots(A), 1);

    # Filter the white noise
    pink_raw = sosfilt(sos, white_noise);

    # scale to [-1, 1])
    y = pink_raw / max(abs(pink_raw(:)));

    # Convert to single if we need to
    if strcmp(typename, "single")
      y = single(y);
    endif

endfunction

%!error pinknoise
%!error pinknoise("double")

%!test
%! pn = pinknoise(100);
%! assert(size(pn), [100  1])
%! assert(class(pn), "double")

%!test
%! pn = pinknoise(100,2);
%! assert(size(pn), [100  2])
%! assert(class(pn), "double")

%!test
%! pn = pinknoise([100,2]);
%! assert(size(pn), [100  2])
%! assert(class(pn), "double")

%!test
%! pn = pinknoise(100, "double");
%! assert(size(pn), [100  1])
%! assert(class(pn), "double")
%! pn = pinknoise(100, "single");
%! assert(size(pn), [100  1])
%! assert(class(pn), "single")

%!test
%! pn = pinknoise(100, 2, "double");
%! assert(size(pn), [100  2])
%! assert(class(pn), "double")
%! pn = pinknoise(100, 2, "single");
%! assert(size(pn), [100  2])
%! assert(class(pn), "single")

%!test
%! pn = pinknoise([100,2], "single");
%! assert(size(pn), [100  2])
%! assert(class(pn), "single")

%!test
%! pn = pinknoise([100,2], "like", single([0]));
%! assert(size(pn), [100  2])
%! assert(class(pn), "single")
%! pn = pinknoise([100,2], "like", [0]);
%! assert(size(pn), [100  2])
%! assert(class(pn), "double")

