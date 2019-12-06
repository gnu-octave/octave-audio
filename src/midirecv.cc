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

// PKG_ADD: autoload ("__midirecv__", "__midi__.oct");
DEFUN_DLD (__midirecv__, args, nargout,
"-*- texinfo -*-\n\
@deftypefn {Package} {} midirecv ()\n \
iNternal function for midirecv\n \
\n \
@end deftypefn")
{

  octave_value_list retval;

  if (0 == args.length())
  {
    print_usage();
    return retval;
  } 
  if (1 < args.length ())
  {
    error ("Expected midi device ");
    return retval;
  }

  if (args (0).type_id () != octave_midi::static_type_id ())
    {
      error ("Expected midi device");
      return retval;
    }

  octave_midi * dev = dynamic_cast<octave_midi*>(args (0).internal_rep ());

  unsigned char buf[1024];
  double ts;

  int ret = dev->recv (&ts, buf, 1024);

  if(ret > 0)
    {
      uint8NDArray data ( dim_vector (1,ret) );
      for (int i=0; i<ret; i++)
        data (i) = buf[i];

      retval(0) = ts;
      retval(1) = data;
    }
  else
    {
      retval(0) = 0;
      retval(1) = uint8NDArray (dim_vector (1,0));
    }

  return retval;
}
