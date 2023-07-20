---
layout: "default"
permalink: "/functions/8_midisync/"
pkg_name: "audio"
pkg_version: "2.0.6"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midisync"
category: "MIDI Controller Interface"
func_name: "midisync"
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
<dt class="deftypefn" id="index-midisync"><span class="category-def">: </span><span><strong class="def-name">midisync</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>)</code><a class="copiable-link" href='#index-midisync'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midisync-1"><span class="category-def">: </span><span><strong class="def-name">midisync</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>, <var class="var">ctrlvalues</var>)</code><a class="copiable-link" href='#index-midisync-1'></a></span></dt>
<dd><p>Send the values of control object to the control, using <var class="var">ctrlvalues</var> values
 if specified instead
</p> 
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">midicontrolObj</var> - control object created using midicontrols<br>
 <var class="var">ctrlvalues</var> - values to send to the controls instead of initial values
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Send sync command to a midicontrols with a ctrlid 2001 to set a value of 1
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 midisync(ctrl, 1);
 </pre></div>


<p><strong class="strong">See also:</strong> midicontrols.
 </p></dd></dl>