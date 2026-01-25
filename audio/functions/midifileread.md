---
layout: "default"
permalink: "/functions/12_midifileread/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifileread"
category: "Domain Conversion"
func_name: "midifileread"
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
<dt class="deftypefn def-line" id="index-midifileread"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midifileread</strong> <code class="def-code-arguments">(<var class="var">filename</var>, [propertyname, propertyvalue &hellip;])</code><a class="copiable-link" href="#index-midifileread"></a></span></dt>
<dd><p>Read MIDI file into a midimsg
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">filename</var> - filename of file to open.<br>
 <var class="var">propertyname</var>, <var class="var">properyvalue</var> - optional propertyname/value pairs.<br>
</p>
<p>Known property values are:
 </p><dl class="table">
<dt>includemetaevents</dt>
<dd><p>A True/False value to include MetaEvents in the out message list.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">msg</var> - a midimsg struct containing the messages read from the file<br>
 </p>
<p><strong class="strong">See also:</strong> midifileinfo, midimsg.
 </p></dd></dl>