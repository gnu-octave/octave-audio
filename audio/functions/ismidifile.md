---
layout: "default"
permalink: "/functions/10_ismidifile/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - ismidifile"
category: "Domain Conversion"
func_name: "ismidifile"
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
<dt class="deftypefn def-line" id="index-ismidifile"><span class="category-def">: </span><span><code class="def-type"><var class="var">ismidi</var> =</code> <strong class="def-name">ismidifile</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code><a class="copiable-link" href="#index-ismidifile"></a></span></dt>
<dd><p>Check if <var class="var">filename</var> is a midi file.
</p>
<p>The function only checks whether it is an existing file and the
 file starts with a valid &rsquo;MThd&rsquo; header.
</p>
<p>Non existing files, or files that do not meet the header criteria will return false.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">filename</var> - filename of file to check.<br>
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">ismidi</var> - true if it is a midi file, false otherwise
</p>

<p><strong class="strong">See also:</strong> midifileread, midifilewrite.
 </p></dd></dl>