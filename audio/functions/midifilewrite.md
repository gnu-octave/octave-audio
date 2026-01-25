---
layout: "default"
permalink: "/functions/13_midifilewrite/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifilewrite"
category: "Domain Conversion"
func_name: "midifilewrite"
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
<dt class="deftypefn def-line" id="index-midifilewrite"><span><strong class="def-name">midifilewrite</strong> <code class="def-code-arguments">(<var class="var">filename</var>, <var class="var">msgs</var>)</code><a class="copiable-link" href="#index-midifilewrite"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midifilewrite-1"><span><strong class="def-name">midifilewrite</strong> <code class="def-code-arguments">(<var class="var">filename</var>, <var class="var">msgs</var>, <var class="var">optionname</var>, <var class="var">optionvalue</var>)</code><a class="copiable-link" href="#index-midifilewrite-1"></a></span></dt>
<dd><p>Write a midifile
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">filename</var> - filename of file to open.<br>
 <var class="var">msg</var> - a midimsg struct or a cell array of midimsg containing data to write to file<br>
 <var class="var">optionname</var>, <var class="var">optionvalue</var> - option value/name pairs<br>
</p>
<p>Known options are:
 </p><dl class="table">
<dt>format</dt>
<dd><p>MIDI file format number. (0 (default), 1, 2)
 </p></dd>
</dl>

<p>Where format is 0, if a cell array is passed to midifilewrite, the midimsg values will
 be concatenated together before saving.
</p>
<p>Were format is not 0, the cell array is treated as tracks of misimsg.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p>None
 </p>
<p><strong class="strong">See also:</strong> midifileread, midimsg.
 </p></dd></dl>