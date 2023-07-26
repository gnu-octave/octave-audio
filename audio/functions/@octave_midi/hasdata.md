---
layout: "default"
permalink: "/functions/@octave_midi/20_octavemidihasdata/"
pkg_name: "audio"
pkg_version: "2.0.7"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - @octave_midi/hasdata"
category: "MIDI Device Interface"
func_name: "@octave_midi/hasdata"
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
<dt class="deftypefn" id="index-hasdata"><span class="category-def">: </span><span><code class="def-type"><var class="var">tf</var> =</code> <strong class="def-name">hasdata</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code><a class="copiable-link" href='#index-hasdata'></a></span></dt>
<dd><p>Return whether there is data available to read
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">dev</var> - a octave midi device opened using mididevice.<br>
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">tf</var> - true if device has data available to read<br>
</p>

<p><strong class="strong">See also:</strong> mididevice.
 </p></dd></dl>