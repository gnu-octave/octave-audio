---
layout: "default"
permalink: "/functions/@octave_midi/20_octavemidihasdata/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - @octave_midi/hasdata"
category: "Domain Conversion"
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
  subitems:
- id: "25_MIDIControllerInterface"
  name: "&nbsp;&nbsp;MIDI Controller Interface"
  url: "/functions/#25_MIDIControllerInterface"
  subitems:
- id: "13_MIDIFileIO"
  name: "&nbsp;&nbsp;MIDI File I/O"
  url: "/functions/#13_MIDIFileIO"
  subitems:
- id: "12_Enumerations"
  name: "&nbsp;&nbsp;Enumerations"
  url: "/functions/#12_Enumerations"
  subitems:
- id: "19_WaveformGeneration"
  name: "&nbsp;&nbsp;Waveform Generation"
  url: "/functions/#19_WaveformGeneration"
  subitems:
- id: "17_DomainConversion"
  name: "&nbsp;&nbsp;Domain Conversion"
  url: "/functions/#17_DomainConversion"
  subitems:
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hasdata"><span><code class="def-type"><var class="var">tf</var> =</code> <strong class="def-name">hasdata</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code></span></dt>
<dd><p>Return whether there is data available to read
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<p><var class="var">dev</var> - a octave midi device opened using mididevice.<br>
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<p><var class="var">tf</var> - true if device has data available to read<br>
</p>

<p><strong class="strong">See also:</strong> mididevice.
 </p></dd></dl>