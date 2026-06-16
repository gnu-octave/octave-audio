---
layout: "default"
permalink: "/functions/9_sweeptone/"
pkg_name: "audio"
pkg_version: "2.0.12"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - sweeptone"
category: "Audio File I/O"
func_name: "sweeptone"
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
- id: "14_AudioFileIO"
  name: "&nbsp;&nbsp;Audio File I/O"
  url: "/functions/#14_AudioFileIO"
  subitems:
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sweeptone_0028_0029"><span><code class="def-type"><var class="var">excitation</var> =</code> <strong class="def-name">sweeptone()</strong></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sweeptone_0028sweepduration_0029"><span><code class="def-type"><var class="var">excitation</var> =</code> <strong class="def-name">sweeptone(<var class="var">sweepduration</var>)</strong></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sweeptone_0028sweepduration_002c"><span><code class="def-type"><var class="var">excitation</var> =</code> <strong class="def-name">sweeptone(<var class="var">sweepduration</var>,</strong> <code class="def-code-arguments"><var class="var">silenceduration</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sweeptone_0028sweepduration_002c-1"><span><code class="def-type"><var class="var">excitation</var> =</code> <strong class="def-name">sweeptone(<var class="var">sweepduration</var>,</strong> <code class="def-code-arguments"><var class="var">silenceduration</var>, <var class="var">fs</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sweeptone_0028_005f_005f_005f_002c"><span><code class="def-type"><var class="var">excitation</var> =</code> <strong class="def-name">sweeptone(___,</strong> <code class="def-code-arguments"><var class="var">propname</var>, <var class="var">propvalue</var> &hellip;)</code></span></dt>
<dd><p>Generate an excitation signal using the exponential swept sine (ESS) technique.
</p>
<p>By default, the signal has a 6-second duration, followed by 4 seconds of silence, for a
 sample rate of 44100 Hz.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<p><var class="var">sweepduration</var> - Positive scalar sweep duration (default 6)
</p>
<p><var class="var">silenceduration</var> - scalar silence durtation to follow the sweep (default 4)
</p>
<p><var class="var">fs</var> - Sample frequency. (default 44100)
</p>
<p><var class="var">propname</var>, <var class="var">propvalue</var> - property name/value pairs.
</p>
<p>Known properties are:
 </p><dl class="table">
<dt>ExcitationLevel</dt>
<dd><p>Excitation Level scalar in the range of [-42, 0] (default -6)
 </p></dd>
<dt>SweepFrequencyRange</dt>
<dd><p>2 element vector for sweep frequency range (default [10 22000]).
 Max value can be fs/2.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<p><var class="var">excitation</var> - Output signal using ESS technique.
</p>
<h4 class="subsubheading" id="Examples"><span>Examples</span></h4>

<p>Create a sweep tone excitation signal by using the sweeptone function.
 sweep duration of 2 seconds, 1 second silence, sample frequency of 44100.
 Then plot it.
</p>
<div class="example">
<pre class="example-preformatted"> excitation = sweeptone (2, 1, 44100);
 plot(excitation)
 </pre></div>

<h4 class="subsubheading" id="References"><span>References</span></h4>

<p>[1] Farina, Angelo.
  <cite class="cite">Advancements in Impulse Response Measurements by Sine Sweeps.</cite>
 Presented at the Audio Engineering Society 122nd Convention, Vienna, Austria, 2007.
</p>
</dd></dl>