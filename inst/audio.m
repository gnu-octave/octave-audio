## Copyright (C) 2019 John Donoghue <john.donoghue@ieee.org>
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## The Audio package provides basic MIDI functionality for GNU octave.
##
## The following MIDI functions are available:
##
## @subsubheading MIDI Device query:
## @table @asis
## @item mididevinfo
## list any MIDI devices detected in the system
## @end table
##
## @subsubheading MIDI Device creation and manipulation:
## @table @asis
## @item mididevice
## Create a midi device
## @item midimsg
## Create a MIDI message or group of messages
## @item midireceive
## receive a MIDI message from a device
## @item midisend
## Send a MIDI message to a device
## @end table
##
## @subsubheading MIDI Controller Interface Functions:
## @table @asis
## @item midiid
## Identify a midi controller
## @item midicontrols
## Create a MIDI controller object
## @item midireceive
## Receive data from a MIDI controller object
## @item midisend
## Send data to a MIDI controller.
## @end table
##
## @subsubheading Writing and reading basic MIDI files:
## @table @asis
## @item midifileinfo
## read information about a MIDI file, including number of tracks, 
## comments etc.
## @item midifileread
## read a MIDI file into a midimsg array
## @item midifilewrite
## write a midimsg array to a MIDI file
## @end table
##
## @subsubheading General usage:
##
## Normal usage would involve querying the devices that are available:
## @example
## mididevinfo
## @end example
##
## Then selecting the device(s) to connect to, and creating a mididevice to perform read and write functionality:
## @example
## dev = mididevice(0);
## @end example
##
## And then performing I/O on the device:
## @example
## msg = midireceive(dev)
## @end example

function audio()
  help audio;
endfunction

