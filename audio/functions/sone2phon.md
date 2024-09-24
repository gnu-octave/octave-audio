---
layout: "default"
permalink: "/functions/9_sone2phon/"
pkg_name: "audio"
pkg_version: "2.0.9"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - sone2phon"
category: "Domain Conversion"
func_name: "sone2phon"
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
<dt class="deftypefn" id="index-sone2phon"><span class="category-def">: </span><span><code class="def-type"><var class="var">phon</var> =</code> <strong class="def-name">sone2phon</strong> <code class="def-code-arguments">(<var class="var">sone</var>)</code><a class="copiable-link" href="#index-sone2phon"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-sone2phon-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">phon</var> =</code> <strong class="def-name">sone2phon</strong> <code class="def-code-arguments">(<var class="var">sone</var>, <var class="var">standard</var>)</code><a class="copiable-link" href="#index-sone2phon-1"></a></span></dt>
<dd><p>Convert from sone to phon.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">sone</var> - Loudness level in sone
</p>
<p><var class="var">standard</var> - Standard to use in conversion. Options are
 &rsquo;ISO 532-1&rsquo; or &rsquo;ISO 532-2&rsquo;.
</p>
<p>&rsquo;ISO 532-1&rsquo; is used if no standard is provided.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">sone</var> - Loudness level in sone
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Convert 100 sone to phon
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">phon = sone2phon(100)</code>
 </pre></div>

<h4 class="subsubheading" id="References"><span>References<a class="copiable-link" href="#References"></a></span></h4>
<p>International Organization for Standardization., <cite class="cite">ISO 532-1 Acoustics – Methods for calculating loudness – Part 1: Zwicker method.</cite>
</p>
<p>International Organization for Standardization., <cite class="cite">ISO 532-2 Acoustics – Methods for calculating loudness – Part 2: Moore-Glasberg method.</cite>
</p>
<p>https://sengpielaudio.com/calculatorSonephon.htm
</p>
</dd></dl>