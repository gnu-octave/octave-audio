---
layout: "default"
permalink: "/functions/7_hz2bark/"
pkg_name: "audio"
pkg_version: "2.0.9"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - hz2bark"
category: "Domain Conversion"
func_name: "hz2bark"
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
<dt class="deftypefn" id="index-hz2bark"><span class="category-def">: </span><span><code class="def-type"><var class="var">bark</var> =</code> <strong class="def-name">hz2bark</strong> <code class="def-code-arguments">(<var class="var">hz</var>)</code><a class="copiable-link" href="#index-hz2bark"></a></span></dt>
<dd><p>Convert hz to equivalent bark frequency
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">hz</var> - input frequency in Hz.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">bark</var> - Output frequency as a bark value
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Convert 4000 Hz to erb
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">erb = hz2erb(4000)</code>
 </pre></div>

<h4 class="subsubheading" id="References"><span>References<a class="copiable-link" href="#References"></a></span></h4>
<p>Traunmüller, Hartmut. <cite class="cite">Analytical Expressions for the Tonotopic Sensory Scale.
 Journal of the Acoustical Society of America. Vol. 88, Issue 1, 1990</cite>
</p>
</dd></dl>