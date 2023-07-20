---
layout: "default"
permalink: "/functions/6_hz2erb/"
pkg_name: "audio"
pkg_version: "2.0.6"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - hz2erb"
category: "Measurements"
func_name: "hz2erb"
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
<dt class="deftypefn" id="index-hz2erb"><span class="category-def">: </span><span><code class="def-type"><var class="var">erb</var> =</code> <strong class="def-name">hz2erb</strong> <code class="def-code-arguments">(<var class="var">hz</var>)</code><a class="copiable-link" href='#index-hz2erb'></a></span></dt>
<dd><p>Convert hz to equivalent rectangular bandwidth (ERB)
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">hz</var> - input frequency in Hz.
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">erb</var> - Output frequency as a erb value
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Convert 4000 Hz to erb
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">erb = hz2erb(4000)</code>
 </pre></div>

<p>Convert a range of Hz to erb
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">erb = hz2erb(4000:100:5000)</code>
 </pre></div>

<h4 class="subsubheading" id="References">References</h4>
<p>Glasberg and Moore. <cite class="cite">Derivation of Auditory Filter Shapes from Notched-Noise Data.
 Hearing Research. Vol. 47, 1990</cite>
</p>
</dd></dl>