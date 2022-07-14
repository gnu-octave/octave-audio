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

#ifndef MIDI_OBJECT_H
#define MIDI_OBJECT_H

// Octave Includes
#include <octave/oct.h>

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif

#include <string>
#include <iostream>
#include <errno.h>

#include "midi.h"

void init_types(void);

class octave_midi : public OCTAVE_BASE_CLASS
{
public:
  octave_midi();
  ~octave_midi();

  bool create(const std::string &inname, const std::string &outname);
  bool send(const unsigned char *data, int sz);
  int recv(double *ts, unsigned char *data, int sz);
  int stat();

  std::string get_callback() const { return callback; };
  int set_callback(const std::string &cb, octave_value cbdata);

  static void octave_midi_callback(void *d);

  void close();
  /**
   * Various properties of the octave_base_value datatype.
   */
  bool is_constant (void) const { return true;}
  bool is_defined (void) const { return true;}
  bool is_object (void) const { return true; }
  bool isobject (void) const { return true; }

  // required to use subsasn
  string_vector map_keys (void) const { return fieldnames; }
  dim_vector dims (void) const { static dim_vector dv(1, 1); return dv; }

  octave_base_value * clone (void) const;
  octave_base_value * empty_clone (void) const;
  octave_base_value * unique_clone (void);

 /**
  * Overloaded methods to print sock as the zeromq id
  */
  void print (std::ostream& os, bool pr_as_read_syntax = false) const;
  void print (std::ostream& os, bool pr_as_read_syntax = false);
  void print_raw (std::ostream& os, bool pr_as_read_syntax) const;

 /**
  * overloaded methods to get properties
  */
  octave_value_list subsref (const std::string& type, const std::list<octave_value_list>& idx, int nargout);

  octave_value subsref (const std::string& type, const std::list<octave_value_list>& idx)
  {
    octave_value_list retval = subsref (type, idx, 1);
    return (retval.length () > 0 ? retval(0) : octave_value ());
  }

  octave_value subsasgn (const std::string& type, const std::list<octave_value_list>& idx, const octave_value& rhs);
private:
  octave_midi(const octave_midi &);

  midi_device * dev;
  string_vector fieldnames;
  std::string callback;
  octave_value callbackdata;

  DECLARE_OV_TYPEID_FUNCTIONS_AND_DATA
};

#endif // MIDI_OBJECT_H
