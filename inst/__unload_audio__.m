## Copyright (C) 2023 John Donoghue
##  
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 3 of the
## License, or (at your option) any later version.
##      
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
## General Public License for more details.
##      
## You should have received a copy of the GNU General Public License
## along with this program; if not, see
## <http:##www.gnu.org/licenses/>.
          
## -*- texinfo -*-
## @deftypefn {} {} __unload_audio__ ()
## Undocumented internal function of audio package.
## @end deftypefn
        
## PKG_DEL: __unload_audio__ ()

function __unload_audio__ ()
  # on package unload, attempt to unload docs
  try
    pkg_dir = fileparts (fullfile (mfilename ("fullpath")));
    doc_file = fullfile (pkg_dir, "doc", "audio.qch");
    if exist(doc_file, "file")
      if exist("__event_manager_unregister_documentation__")
        __event_manager_unregister_documentation__ (doc_file);
      elseif exist("__event_manager_unregister_doc__")
        __event_manager_unregister_doc__ (doc_file);
      endif
    endif
  catch
    # do nothing
  end_try_catch
endfunction
