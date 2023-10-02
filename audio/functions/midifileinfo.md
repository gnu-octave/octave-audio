---
layout: "default"
permalink: "/functions/12_midifileinfo/"
pkg_name: "audio"
pkg_version: "2.0.8"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifileinfo"
category: "MIDI File I/O"
func_name: "midifileinfo"
navigation:
- id: "overview"
  name: "Overview"
  url: "/index"
- id: "Functions"
  name: "Function Reference"
  url: "/functions"
- id: "21_MIDIDeviceInterface"
  name: "&nbsp;&nbsp;MIDI Device Interface"
  url: "/functions/#21_MIDIDeviceInterface"
- id: "25_MIDIControllerInterface"
  name: "&nbsp;&nbsp;MIDI Controller Interface"
  url: "/functions/#25_MIDIControllerInterface"
- id: "13_MIDIFileIO"
  name: "&nbsp;&nbsp;MIDI File I/O"
  url: "/functions/#13_MIDIFileIO"
- id: "12_Enumerations"
  name: "&nbsp;&nbsp;Enumerations"
  url: "/functions/#12_Enumerations"
- id: "19_WaveformGeneration"
  name: "&nbsp;&nbsp;Waveform Generation"
  url: "/functions/#19_WaveformGeneration"
- id: "12_Measurements"
  name: "&nbsp;&nbsp;Measurements"
  url: "/functions/#12_Measurements"
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn">
<dt class="deftypefn" id="index-midifileinfo"><span class="category-def">: </span><span><code class="def-type"><var class="var">info</var> =</code> <strong class="def-name">midifileinfo</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code><a class="copiable-link" href='#index-midifileinfo'></a></span></dt>
<dd><p>Read MIDI file and display information about the tracks and data
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">filename</var> - filename of file to open.<br>
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">info</var> - structure of the midi file data
 with the following fields:<br>
 </p><dl class="table">
<dt>filename</dt>
<dd><p>the name of the file
 </p></dd>
<dt>header</dt>
<dd><p>The header block information
 </p></dd>
<dt>track</dt>
<dd><p>An array of tracks read from the file
 </p></dd>
<dt>other</dt>
<dd><p>An array of non-track midi blocks read from the file
 </p></dd>
</dl>

<p><strong class="strong">See also:</strong> midifileread.
 </p></dd></dl>