---
layout: "default"
permalink: "/functions/12_midifileinfo/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifileinfo"
category: "Domain Conversion"
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
<dt class="deftypefn def-line" id="index-midifileinfo"><span><code class="def-type"><var class="var">info</var> =</code> <strong class="def-name">midifileinfo</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code></span></dt>
<dd><p>Read MIDI file and display information about the tracks and data
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<p><var class="var">filename</var> - filename of file to open.<br>
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
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