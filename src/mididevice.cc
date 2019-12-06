// Copyright (C) 2019 John Donoghue <john.donoghue@ieee.org>
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

// PKG_ADD: autoload ("__mididevice__", "__midi__.oct");
DEFUN_DLD (__mididevice__, args, nargout,
"-*- texinfo -*-\n\
@deftypefn {Package} {@var{dev} = }  __mididevice__(inputdev, outputdev)\n \
private function to create a midi device\n \
\n \
@seealso{mididevice}\n \
@end deftypefn")
{

  if ( 2 != args.length ())
    {
      print_usage();
      return octave_value ();
    } 

  octave_value in_dev = args (0);
  octave_value out_dev = args (1);

  std::string in_dev_name = in_dev.is_string () ? in_dev.string_value () : "";
  std::string out_dev_name = out_dev.is_string () ? out_dev.string_value () : "";

  init_types ();

  octave_midi * retvalue = new octave_midi ();

  if ( retvalue->create (in_dev_name, out_dev_name)  == false )
    {
      delete retvalue;
      return octave_value ();
    }

  return octave_value (retvalue);
}
