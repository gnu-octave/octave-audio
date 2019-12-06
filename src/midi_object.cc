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

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif

#include "midi_object.h"

DEFINE_OV_TYPEID_FUNCTIONS_AND_DATA (octave_midi, "octave_midi", "octave_midi");

octave_midi::octave_midi ()
 : fieldnames(5)
{
  fieldnames[0] = "type";
  fieldnames[1] = "endpoint";
  fieldnames[2] = "identity";
  fieldnames[3] = "recvmore";
  fieldnames[4] = "events";

  dev = 0;
}

octave_midi::octave_midi (const octave_midi &m)
{
  fieldnames = m.fieldnames;
}

octave_midi::~octave_midi (void)
{
  close ();
}

bool
octave_midi::create (const std::string &inname, const std::string &outname)
{
  close ();

  dev = open_midi (inname, outname);

  return true;
}

bool
octave_midi::send (const unsigned char * data, int sz)
{
  return send_midi (dev, data, sz);
}

int
octave_midi::recv (double *ts, unsigned char * data, int sz)
{
  return recv_midi (dev, ts, data, sz);
}

void
octave_midi::close ()
{
 if(dev) close_midi(dev);
}

octave_base_value *
octave_midi::empty_clone (void) const
{
  return new octave_midi();
}

octave_base_value *
octave_midi::clone (void) const
{
  return new octave_midi (*this);
}

octave_base_value *
octave_midi::unique_clone (void)
{
  return this;
}

void
octave_midi::print (std::ostream& os, bool pr_as_read_syntax) const
{
  print_raw (os, pr_as_read_syntax);
  newline (os);
}

void
octave_midi::print (std::ostream& os, bool pr_as_read_syntax)
{
  print_raw (os, pr_as_read_syntax);
  newline (os);
}

void
octave_midi::print_raw (std::ostream& os, bool pr_as_read_syntax) const
{
  os << "  mididevice connected to"; newline (os);
  midi_device_info in = get_midi_info(dev, false);
  midi_device_info out = get_midi_info(dev, true);
  if (in.isvalid ())
    {
      os << "    input: '" << in.name << "' (" << in.id << ")"; newline(os);
    }
  if (out.isvalid ())
    {
      os << "    output: '" << out.name << "' (" << out.id << ")"; newline(os);
    }
}

octave_value_list
octave_midi::subsref (const std::string& type, const std::list<octave_value_list>& idx, int nargout)
{
  octave_value_list retval;

  error ("octave_midi object cannot be indexed with %c", type[0]);

  return retval;
}

octave_value
octave_midi::subsasgn (const std::string& type, const std::list<octave_value_list>& idx, const octave_value& rhs)
{
  octave_value retval;

  error ("octave_midi object cannot be indexed with %c", type[0]);

  return retval;
}

static bool type_loaded = false;

void init_types(void)
{
  if (!type_loaded)
    {
      octave_midi::register_type ();
      type_loaded = true;
    }
}
