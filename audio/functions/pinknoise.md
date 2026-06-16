---
layout: "default"
permalink: "/functions/9_pinknoise/"
pkg_name: "audio"
pkg_version: "2.0.12"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - pinknoise"
category: "Audio File I/O"
func_name: "pinknoise"
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
<dt class="deftypefn def-line" id="index-pinknoise_0028n_0029"><span><code class="def-type"><var class="var">X</var> =</code> <strong class="def-name">pinknoise(<var class="var">n</var>)</strong></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pinknoise_0028sz_0029"><span><code class="def-type"><var class="var">X</var> =</code> <strong class="def-name">pinknoise(<var class="var">sz</var>)</strong></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pinknoise_0028sz1_002c"><span><code class="def-type"><var class="var">X</var> =</code> <strong class="def-name">pinknoise(<var class="var">sz1</var>,</strong> <code class="def-code-arguments"><var class="var">sz2</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pinknoise_0028_005f_005f_005f_002c"><span><code class="def-type"><var class="var">X</var> =</code> <strong class="def-name">pinknoise(___,</strong> <code class="def-code-arguments"><var class="var">typename</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-pinknoise_0028_005f_005f_005f_002c-1"><span><code class="def-type"><var class="var">X</var> =</code> <strong class="def-name">pinknoise(___,</strong> <code class="def-code-arguments">'like', <var class="var">p</var>)</code></span></dt>
<dd><p>Create pinknoise using random numbers through a series of randomly initiated SOS filters..
</p>
<p>Note: this function uses zp2sos and sosfilt from the signal package, which will be loaded
 as part of calling this function.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<p><var class="var">n</var> - scalar value for length of the pinknoise
</p>
<p><var class="var">sz</var> - A 2 element vector for [length, number_of_channels]
</p>
<p><var class="var">sz1</var>, <var class="var">sz2</var> - scalar length and number of channels.
</p>
<p><var class="var">typename</var> - datatype to create - &rsquo;double&rsquo; or &rsquo;single&rsquo;.
</p>
<p><var class="var">p</var> - matrix of data to use class type &rsquo;double&rsquo; or &rsquo;single&rsquo;.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<p><var class="var">X</var> - pinknoise output
</p>
<h4 class="subsubheading" id="Examples"><span>Examples</span></h4>
<p>Create 10 second 2 channel pink noise waveform at 44.1kHz
</p>
<div class="example">
<pre class="example-preformatted"> fs = 44.1e3;
 duration = 10;
 y = pinknoise (duration*fs, 2);
 </pre></div>


<p><strong class="strong">See also:</strong> whitenoise.
 </p></dd></dl>