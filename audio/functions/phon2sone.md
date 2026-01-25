---
layout: "default"
permalink: "/functions/9_phon2sone/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - phon2sone"
category: "Domain Conversion"
func_name: "phon2sone"
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
<dt class="deftypefn def-line" id="index-phon2sone"><span class="category-def">: </span><span><code class="def-type"><var class="var">sone</var> =</code> <strong class="def-name">phon2sone</strong> <code class="def-code-arguments">(<var class="var">phon</var>)</code><a class="copiable-link" href="#index-phon2sone"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phon2sone-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">sone</var> =</code> <strong class="def-name">phon2sone</strong> <code class="def-code-arguments">(<var class="var">phon</var>, <var class="var">standard</var>)</code><a class="copiable-link" href="#index-phon2sone-1"></a></span></dt>
<dd><p>Convert from phon to sone
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">phon</var> - Loudness level in phon
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
<p>Convert 100 phon to sone
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">sone = phon2sone(100)</code>
 </pre></div>

<h4 class="subsubheading" id="References"><span>References<a class="copiable-link" href="#References"></a></span></h4>
<p>International Organization for Standardization., <cite class="cite">ISO 532-1 Acoustics – Methods for calculating loudness – Part 1: Zwicker method.</cite>
</p>
<p>International Organization for Standardization., <cite class="cite">ISO 532-2 Acoustics – Methods for calculating loudness – Part 2: Moore-Glasberg method.</cite>
</p>
<p>https://sengpielaudio.com/calculatorSonephon.htm
</p>
</dd></dl>