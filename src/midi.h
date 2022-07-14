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

#ifndef MIDI_H
#define MIDI_H

#include <vector>

class midi_device;

class midi_device_info
{
public:
  midi_device_info() { id=-1; devid=-1; };
  virtual ~midi_device_info() {}

  bool isvalid() const { return id!= -1; }

  int id;
  std::string name;
  bool output;
  std::string driver;
  int devid;
};

class midi_device_list : public std::vector <midi_device_info>
{
public:
  midi_device_info  get_id(int id) const
  {
    for(size_t i=0; i<size(); i++)
    {
      midi_device_info  v = (*this)[i];
      if (v.id == id) return v;
    }
    return midi_device_info();
  }
  midi_device_info  get_name(const std::string &n, bool output) const
  {
    for(size_t i=0; i<size(); i++)
    {
      midi_device_info  v = (*this)[i];
      if (v.name == n && v.output == output) return v;
    }
    return midi_device_info ();
  }

};

bool get_midi_devices(midi_device_list &devs);


midi_device * open_midi(const std::string &inname, const std::string &outname);

void close_midi(midi_device *);

midi_device_info get_midi_info(midi_device * dev, bool output);

bool send_midi(midi_device * dev, const unsigned char *data, size_t sz);

int recv_midi(midi_device * dev, double *ts, unsigned char *data, size_t sz);

int stat_midi(midi_device * dev);


typedef void(* MidiCallback )(void *userData);

int set_midi_callback(midi_device * dev, MidiCallback cb, void *userdata);

#endif

