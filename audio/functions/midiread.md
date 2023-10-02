---
layout: "default"
permalink: "/functions/8_midiread/"
pkg_name: "audio"
pkg_version: "2.0.8"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midiread"
category: "MIDI Controller Interface"
func_name: "midiread"
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
<dt class="deftypefn" id="index-midiread"><span class="category-def">: </span><span><code class="def-type"><var class="var">val</var> =</code> <strong class="def-name">midiread</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>)</code><a class="copiable-link" href='#index-midiread'></a></span></dt>
<dd><p>Read current values of midi controls
</p> 
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">midicontrolObj</var> - control object created using midicontrols<br>
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">val</var> single value or array of current values from the midi device.
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Read current value of midicontrols with a ctrlid 2001 on the default midi device.
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 val = midiread(ctrl);
 </pre></div>

<p>Read current value of midicontrols with a ctrlid 2001 on a non default midi device.
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001, 'mididevice', 1)
 val = midiread(ctrl);
 </pre></div>


<p><strong class="strong">See also:</strong> midicontrols, midisync.
 </p></dd></dl>