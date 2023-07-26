---
layout: "default"
permalink: "/functions/8_midisend/"
pkg_name: "audio"
pkg_version: "2.0.7"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midisend"
category: "MIDI Device Interface"
func_name: "midisend"
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
<dt class="deftypefn" id="index-midisend"><span class="category-def">: </span><span><strong class="def-name">midisend</strong> <code class="def-code-arguments">(<var class="var">dev</var>, <var class="var">msg</var>)</code><a class="copiable-link" href='#index-midisend'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midisend-1"><span class="category-def">: </span><span><strong class="def-name">midisend</strong> <code class="def-code-arguments">(<var class="var">dev</var>, ...)</code><a class="copiable-link" href='#index-midisend-1'></a></span></dt>
<dd><p>Send a midimsg to a midi device
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">dev</var> - midi device opened using mididevice<br>
 <var class="var">msg</var> - a midi message class with messages to send to the midi device<br>
 If the msg isn&rsquo;t a midimsg class, the input data is expected to be in same format as the inputs to a midimsg object.
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Send a note on/off command to a opened midi device <var class="var">dev</var>
 </p><div class="example">
<pre class="example-preformatted"> midisend(dev, midimsg(&quot;note&quot;, 1, 60, 100, 2.0));
 </pre></div>
 

<p><strong class="strong">See also:</strong> midimsg, mididevice, midireceive.
 </p></dd></dl>