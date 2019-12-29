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

#include "midi.h"
#include <octave/oct.h>

static std::string api_name(RtMidi::Api api)
{
  switch(api)
    {
      case RtMidi::Api::MACOSX_CORE: return "MacOS Core";
      case RtMidi::Api::LINUX_ALSA: return "Alsa";
      case RtMidi::Api::UNIX_JACK: return "Jack";
      case RtMidi::Api::WINDOWS_MM: return "MMSystem";
      default: break;
    }
  return "Unknown";
}

class midi_device
{
public:
  RtMidiIn *in;
  RtMidiOut *out;

  midi_device_info in_info;
  midi_device_info out_info;

  midi_device ()
  {
    in = 0;
    out = 0;

    out = new RtMidiOut();
    in = new RtMidiIn();
  }
  virtual
   ~midi_device ()
  {
    if(in) delete in;
    if(out) delete out;
  }
private:
  midi_device (const midi_device &d) {}
  midi_device & operator== (const midi_device &d) { return *this; }
};

void
close_midi (midi_device * dev)
{
  if (dev)
    {
      delete dev;
    }
}

midi_device_info
get_midi_info (midi_device * dev, bool output)
{
  midi_device_info m;
  if (dev)
  {
    if (output)
    {
      m = dev->out_info;
    }
    else
    {
      m = dev->in_info;
    }
  }
  return m;
}

midi_device *
open_midi (const std::string &inname, const std::string &outname)
{
  midi_device * dev = new midi_device ();

  midi_device_list devs;
  get_midi_devices(devs);

  dev->in_info = devs.get_name (inname, false);
  dev->out_info = devs.get_name (outname, true);

  if (dev->in_info.isvalid ())
    dev->in->openPort (dev->in_info.devid);

  if (dev->out_info.isvalid ())
    dev->out->openPort (dev->out_info.devid);

  return dev;
}

bool
send_midi (midi_device *dev, const unsigned char *data, size_t sz)
{
  if (dev && dev->out)
    {
      try
        {
          std::vector<unsigned char> message (data, data+sz);
          dev->out->sendMessage (&message);
          return true;
        }
      catch (const RtMidiError &err)
        {
          error ("Error getting midi info: '%s'", err.getMessage ().c_str ());
        }
    }
  return false;
}

int
recv_midi (midi_device *dev, double *ts, unsigned char *data, size_t sz)
{
  if (dev && dev->in)
  {
    try 
      {
        std::vector<unsigned char> message;
        double stamp = dev->in->getMessage (&message);
        if (message.size() > 0)
          {
            for (size_t i=0;i<message.size() && i<sz; i++)
              data[i] = message[i];

            *ts = stamp;
            return (int)message.size();
          }
      }
    catch(const RtMidiError &err)
      {
        error ("Error reading midi: '%s'", err.getMessage ().c_str ());
        return -1;
      }
  }
  return 0;
}

bool
get_midi_devices (midi_device_list &devs)
{
  bool ok = false;

  devs = midi_device_list();

  RtMidiOut * midiout = 0;
  RtMidiIn * midiin = 0;
  try 
    {
       midiout = new RtMidiOut();
       midiin = new RtMidiIn();

       size_t numinput = midiin->getPortCount();
       size_t numoutput = midiout->getPortCount();

       for (size_t i=0; i<numoutput; i++)
         {
           midi_device_info inf;
           inf.name = midiout->getPortName(i).c_str();
           inf.driver = api_name(midiout->getCurrentApi());
           inf.id = i;
           inf.devid = i;
           inf.output = true;
           devs.push_back(inf);
         }

       for (size_t i=0; i<numinput; i++)
         {
           midi_device_info inf;
           inf.name = midiin->getPortName(i).c_str();
           inf.driver = api_name(midiin->getCurrentApi());
           inf.id = numoutput + i;
           inf.devid = i;
           inf.output = false;
           devs.push_back(inf);
         }

       ok = true;

    }
  catch (const RtMidiError &err)
    {
      error ("Error getting midi info: '%s'", err.getMessage ().c_str ());
    }

  if(midiout)
    delete midiout;
  if(midiin)
    delete midiin;

  return ok;
}

