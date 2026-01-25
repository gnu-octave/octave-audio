---
layout: "default"
permalink: "/functions/6_hz2mel/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - hz2mel"
category: "Domain Conversion"
func_name: "hz2mel"
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
<dt class="deftypefn def-line" id="index-hz2mel"><span class="category-def">: </span><span><code class="def-type"><var class="var">mel</var> =</code> <strong class="def-name">hz2mel</strong> <code class="def-code-arguments">(<var class="var">hz</var>)</code><a class="copiable-link" href="#index-hz2mel"></a></span></dt>
<dd><p>Convert hz to equivalent mel frequency.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">hz</var> - input frequency in Hz.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">mel</var> - Output frequency as a mel value
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Convert 4000 Hz to mel
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">mel = hz2mel(4000)</code>
 </pre></div>

<p>Convert a range of Hz to mel
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">mel = hz2erb(4000:100:5000)</code>
 </pre></div>

<h4 class="subsubheading" id="References"><span>References<a class="copiable-link" href="#References"></a></span></h4>
<p>O&rsquo;Shaghnessy, Douglas. <cite class="cite">Speech Communication: Human and Machine. Reading, MA:
 Addison-Wesley Publishing Company, 1987</cite>
</p>
</dd></dl>