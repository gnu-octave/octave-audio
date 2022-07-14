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

// PKG_ADD: autoload ("__midiflush__", "__midi__.oct");
DEFUN_DLD (__midiflush__, args, nargout,
"-*- texinfo -*-\n\
@deftypefn {Package} {} midiflush ()\n \
Internal function for midiflush\n \
\n \
@end deftypefn")
{

  octave_value retval;

  if (0 == args.length())
    {
      print_usage();
      return retval;
    } 
  if (args (0).type_id () != octave_midi::static_type_id ())
    {
      error ("Expected midi device");
      return retval;
    }

  octave_midi * dev = dynamic_cast<octave_midi*>(args (0).internal_rep ());

  dev->flush();

  return retval;
}
