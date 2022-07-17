Introduction
============

The Octave Audio package provides MIDI device functions for GNU Octave

Requirements
============

* Octave >= 4.0.0

* [RTMIDI](https://github.com/thestk/rtmidi) library and include files 


Installing
==========

To install, run the octave package manager:

1. If running Windows, the package may already be installed:

   pkg list audio

2. To install from source forge:
   pkg install -forge audio

3. To install from a local tarball.
   pkg install audio-XXXXXXX.tar.gz
   Where XXXXXXX is the version of the the downloaded tarball.

Usage:
======

1. Load the package.
   pkg load audio
   (Required each time Octave is started)

2. Type help audio at the octave prompt to display a list of functions

Documentation
==============

See the function list for octave-audio on [octave forge](https://octave.sourceforge.io/audio/overview.html) for function documentation.

See the online manual for octave-audio on [octave forge](https://octave.sourceforge.io/audio/package_doc/) for complete documentation.

Read the Octave [Octave audio package wiki](https://wiki.octave.org/Audio_package) for install tips and examples.

Known limitations and bugs
==========================

Currently the package provides only midi functions
