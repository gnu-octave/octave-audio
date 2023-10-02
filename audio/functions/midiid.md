---
layout: "default"
permalink: "/functions/6_midiid/"
pkg_name: "audio"
pkg_version: "2.0.8"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midiid"
category: "MIDI Controller Interface"
func_name: "midiid"
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
<dt class="deftypefn" id="index-midiid"><span class="category-def">: </span><span><code class="def-type">[<var class="var">ctrlid</var>, <var class="var">dev</var>] =</code> <strong class="def-name">midiid</strong> <code class="def-code-arguments">()</code><a class="copiable-link" href='#index-midiid'></a></span></dt>
<dd><p>Scan for control messages from midi devices to get the id of the device
</p> 
<p>Function will display a prompt for the user to move the midi control and return when
 a control messages is detected or ctrl-C is pressed.
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">ctrlid</var> - control id made from the controller channel * 1000 + controller number.<br>
 <var class="var">dev</var> = name of the midi device the controller was detected on.
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Monitor midi devices for first moving controller
 </p><div class="example">
<pre class="example-preformatted"> [ctrlid, devname] = midiid()
 </pre></div>


<p><strong class="strong">See also:</strong> mididevinfo, midicontrols.
 </p></dd></dl>