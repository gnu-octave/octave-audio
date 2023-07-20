---
layout: "default"
permalink: "/functions/10_mididevice/"
pkg_name: "audio"
pkg_version: "2.0.6"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - mididevice"
category: "MIDI Device Interface"
func_name: "mididevice"
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
<dt class="deftypefn" id="index-mididevice"><span class="category-def">: </span><span><code class="def-type"><var class="var">dev</var> =</code> <strong class="def-name">mididevice</strong> <code class="def-code-arguments">(<var class="var">mididev</var>)</code><a class="copiable-link" href='#index-mididevice'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-mididevice-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">dev</var> =</code> <strong class="def-name">mididevice</strong> <code class="def-code-arguments">(<var class="var">mididir</var>, <var class="var">mididev</var>)</code><a class="copiable-link" href='#index-mididevice-1'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-mididevice-2"><span class="category-def">: </span><span><code class="def-type"><var class="var">dev</var> =</code> <strong class="def-name">mididevice</strong> <code class="def-code-arguments">(&quot;input&quot;, <var class="var">midiindev</var>, &quot;output&quot;, <var class="var">midioutdev</var>)</code><a class="copiable-link" href='#index-mididevice-2'></a></span></dt>
<dd><p>Create a midi device using the input parameters.
</p>
<p>When a single device name or id is provided, attempt to create the midi device using the same name for both input and output.
</p>
<p>Otherwise, use the name or device id for the given input or output direction.
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">mididev</var> - name or id of device to load.<br>
 <var class="var">mididir</var> - midi direction of &quot;input&quot; or &quot;output&quot;<br>
 <var class="var">midiindev</var> - midi input name or id<br>
 <var class="var">midioutdev</var> - midi output name or id
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">dev</var> - octave_midi class for opened device
</p>
<h4 class="subsubheading" id="Properties">Properties</h4>
<p><var class="var">Input</var> - Input device name (read only).<br>
 <var class="var">Output</var> - Output device name (read only).<br>
 <var class="var">InputID</var> - Input device id (read only).<br>
 <var class="var">OutputID</var> - Output device id (read only).<br>
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Open midi device with ID of 0.
 </p><div class="example">
<pre class="example-preformatted"> <code class="command">&gt;</code> dev = mididevice(0);

  mididevice connected to
    input: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (1)
    output: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (0)
 </pre></div>

<p>Open a named midi device:
 </p><div class="example">
<pre class="example-preformatted"> <code class="command">&gt;</code> dev = mididevice(&quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot;);

  mididevice connected to
    input: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (1)
    output: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (0)
 </pre></div>


<p><strong class="strong">See also:</strong> mididevinfo.
 </p></dd></dl>