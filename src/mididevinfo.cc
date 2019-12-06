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

#include "midi.h"

// PKG_ADD: autoload ("__mididevinfo__", "__midi__.oct");
DEFUN_DLD (__mididevinfo__, args, nargout,
"-*- texinfo -*-\n\
@deftypefn {Package} {} __mididevinfo__ ()\n \
Internal function to retieve midi devices\n \
@end deftypefn")
{
  octave_value retval;

  midi_device_list devs;

  if (get_midi_devices(devs))
    {
      Cell name (dim_vector (1, devs.size()));
      Cell driver (dim_vector (1, devs.size()));
      Cell id (dim_vector (1, devs.size()));
      Cell dir (dim_vector (1, devs.size()));

      for(size_t i=0; i<devs.size(); i++)
        {
	  midi_device_info dev = devs[i];

	  name(i) = dev.name;
          driver(i) = dev.driver;
          id(i) = dev.id;

	  if(dev.output)
	    {
	      dir(i) = "output";
	    }
	  else
	    {
	      dir(i) = "input";
	    }
        }

      octave_map devinfo;
      devinfo.setfield("ID", id);
      devinfo.setfield("Direction", dir);
      devinfo.setfield("Interface", driver);
      devinfo.setfield("Name", name);

      retval = devinfo;
    } 

  return retval;
}
