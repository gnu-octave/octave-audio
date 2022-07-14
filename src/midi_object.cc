// Copyright (C) 2019-2020 John Donoghue <john.donoghue@ieee.org>
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

#include <octave/quit.h>

#include "midi_object.h"

DEFINE_OV_TYPEID_FUNCTIONS_AND_DATA (octave_midi, "octave_midi", "octave_midi");

void octave_midi::octave_midi_callback (void *userData)
{
  octave_midi * dev = (octave_midi *)userData;
  if(dev && dev->callback.length() >0)
  {
    try
      {
          octave_value_list ret = OCTAVE__FEVAL (dev->callback, ovl (dev->callbackdata), 0);
      }
    catch (const octave::execution_exception &e)
      {
        warning("midicallback: %s", e.message().c_str());
      }
  }
}


octave_midi::octave_midi ()
 : fieldnames(4)
{
  fieldnames[0] = "Input";
  fieldnames[1] = "Output";
  fieldnames[2] = "InputID";
  fieldnames[3] = "OutputID";

  callback = "";
  callbackdata = "";

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

int
octave_midi::set_callback(const std::string &cb, octave_value cbdata)
{
  callback = cb;
  callbackdata = cbdata;
  set_midi_callback(dev, octave_midi_callback, this);
  return 1;
}


int
octave_midi::stat ()
{
  return stat_midi (dev);
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
  count++;
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

  int skip = 1;

  switch (type[0])
    {
    default:
      error ("octave_midi object cannot be indexed with %c", type[0]);
      break;
    case '.':
      {
        std::string propname = (((idx.front()) (0)).string_value ());
        if (propname == "Input")
          retval(0) = get_midi_info(dev, false).name;
        else if (propname == "Output")
          retval(0) = get_midi_info(dev, true).name;
        else if (propname == "InputID")
          retval(0) = get_midi_info(dev, false).id;
        else if (propname == "OutputID")
          retval(0) = get_midi_info(dev, true).id;
        else
          error ("octave_midi object unknown property '%s'", propname.c_str());
      }
      break;
    }

  if (idx.size () > 1 && type.length () > 1)
    retval = retval (0).next_subsref (nargout, type, idx, skip);

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
