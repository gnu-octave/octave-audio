## Copyright (C) 2022 John Donoghue <john.donoghue@ieee.org>
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
## @deftypefn {} {@var{oldhandle} =} midicallback (@var{midicontrolsObj}, @var{functionHandle})
## @deftypefnx {} {@var{oldhandle} =} midicallback (@var{midicontrolsObj}, [])
## @deftypefnx {} {@var{currhandle} =} midicallback (@var{midicontrolsObj})
## Get, set or clear the midicontrol object callback.
## 
## @subsubheading Inputs
## @var{midicontrolObj} - control object created using midicontrols.
##
## @var{functionHandle} - function handle to set for call back. If it is [],
## the callback function will be cleared.
##
## @strong{NOTE}: currently anonymous functions will not work.
##
## @strong{NOTE}: callbacks should be cleared before losing all references to the midicontrols 
## object.
##
## @subsubheading Outputs
## @var{oldhandle} The previously set midicallback function handle when setting a new callback.
##
## @var{currhandle} The current set midicallback function handle.
##
## @subsubheading Examples
## Set a callback on a midicontrols object
## @example
## ctrl = midicontrols(2001)
## function dispCallback(ctrl),disp(midiread(ctrl)),endfunction;
## midicallback(ctrl, @@dispCallback);
## @end example
##
## Clear the callback on a midicontrols object
## @example
## ctrl = midicontrols(2001)
## midicallback(ctrl, []);
## @end example
##
## Get the current callback on a midicontrols object
## @example
## ctrl = midicontrols(2001)
## cb = midicallback(ctrl);
## @end example
##
## @seealso{midicontrols, midisync, midiread}
## @end deftypefn
function ret = midicallback (ctrlobj, varargin)
  if nargin < 1 || !isa (ctrlobj, "midicontrols")
    error ("Expected midicontrols object");
  endif

  if nargin > 1
    cb = varargin{1};
    if isempty(cb)
       callback = "";
    elseif strcmp(class(cb), "function_handle")
       info = functions(cb);
       if strcmp(info.type, "anonymous")
         error ("anonymous are currently not supported");
       endif
       callback = func2str(cb);
    elseif ischar (cb)
       callback = cb;
    else
       error ("Callback should be a string or function handle or []")
    endif

    ret =   ctrlobj.callback(callback);
  else
    ret =   ctrlobj.callback();
  endif
endfunction

%!function testcallback(ctrl)
%! # do nothing
%!endfunction

%!test
%! a = midicontrols();
%! assert(isa(a, "midicontrols"));
%! assert(midicallback(a), []);
%! assert(midicallback(a, @testcallback), []);
%! assert(midicallback(a), func2str(@testcallback));
%! midicallback(a, []);
%! assert(midicallback(a), []);

%!error <Expected midicontrols object> midicallback(0);
