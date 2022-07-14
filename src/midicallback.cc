// Copyright (C) 2022 John Donoghue <john.donoghue@ieee.org>
//
// This program is free software; you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program; if not, see <http://www.gnu.org/licenses/>.

// Octave Includes
#include <octave/oct.h>
#include <octave/defun-dld.h>
#include <octave/ov.h>

#include <iostream>
#include <iomanip>

#if defined (HAVE_CONFIG_H)
#  include "config.h"
#endif

#include "midi_object.h"
#include "midi.h"

// PKG_ADD: autoload ("__midicallback__", "__midi__.oct");
DEFUN_DLD (__midicallback__, args, nargout,
"-*- texinfo -*-\n\
@deftypefn {Package} {} __midicallback__ ()\n \
Internal function for midicallback\n \
\n \
@end deftypefn")
{

  octave_value_list retval;

  if (1 > args.length ())
  {
    error ("Expected at least a midi device");
    return retval;
  }

  if (args (0).type_id () != octave_midi::static_type_id ())
    {
      error ("Expected midi device");
      return retval;
    }

  octave_midi * dev = dynamic_cast<octave_midi*>(args (0).internal_rep ());

  std::string callback = dev->get_callback();
  if (args.length () > 2)
    {
      if (!args(1).is_string())
        {
          error ("Expected callback as string");
          return retval;
        }
      // set
      dev->set_callback(args(1).string_value(), args(2));
    }
  else if (args.length () != 1)
    {
      error ("Expected mididevice with optional (callback, data)");
      return retval;
    }

  retval(0) = callback;

  return retval;
}
