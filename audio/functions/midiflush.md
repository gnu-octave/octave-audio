---
layout: "default"
permalink: "/functions/9_midiflush/"
pkg_name: "audio"
pkg_version: "2.0.9"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midiflush"
category: "MIDI Device Interface"
func_name: "midiflush"
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
- id: "17_DomainConversion"
  name: "&nbsp;&nbsp;Domain Conversion"
  url: "/functions/#17_DomainConversion"
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn">
<dt class="deftypefn" id="index-midiflush"><span class="category-def">: </span><span><strong class="def-name">midiflush</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code><a class="copiable-link" href="#index-midiflush"></a></span></dt>
<dd><p>Flush the receive buffers on a midi device
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">dev</var> - midi device opened using mididevice<br>
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Flush a midi device
 </p><div class="example">
<pre class="example-preformatted"> midiflush(dev);
 </pre></div>
 

<p><strong class="strong">See also:</strong> mididevice, midireceive.
 </p></dd></dl>