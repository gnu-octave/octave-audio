---
layout: "default"
permalink: "/functions/10_mididevice/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-mididevice"><span class="category">: </span><span><em><var>dev</var> =</em> <strong>mididevice</strong> <em>(<var>mididev</var>)</em><a href='#index-mididevice' class='copiable-anchor'></a></span></dt>
<dt id="index-mididevice-1"><span class="category">: </span><span><em><var>dev</var> =</em> <strong>mididevice</strong> <em>(<var>mididir</var>, <var>mididev</var>)</em><a href='#index-mididevice-1' class='copiable-anchor'></a></span></dt>
<dt id="index-mididevice-2"><span class="category">: </span><span><em><var>dev</var> =</em> <strong>mididevice</strong> <em>(&quot;input&quot;, <var>midiindev</var>, &quot;output&quot;, <var>midioutdev</var>)</em><a href='#index-mididevice-2' class='copiable-anchor'></a></span></dt>
<dd><p>Create a midi device using the input parameters.
</p>
<p>When a single device name or id is provided, attempt to create the midi device using the same name for both input and output.
</p>
<p>Otherwise, use the name or device id for the given input or output direction.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>mididev</var> - name or id of device to load.<br>
 <var>mididir</var> - midi direction of &quot;input&quot; or &quot;output&quot;<br>
 <var>midiindev</var> - midi input name or id<br>
 <var>midioutdev</var> - midi output name or id
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>dev</var> - octave_midi class for opened device
</p>
<span id="Properties"></span><h4 class="subsubheading">Properties</h4>
<p><var>Input</var> - Input device name (read only).<br>
 <var>Output</var> - Output device name (read only).<br>
 <var>InputID</var> - Input device id (read only).<br>
 <var>OutputID</var> - Output device id (read only).<br>
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Open midi device with ID of 0.
 </p><div class="example">
<pre class="example"> <code>&gt;</code> dev = mididevice(0);

  mididevice connected to
    input: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (1)
    output: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (0)
 </pre></div>

<p>Open a named midi device:
 </p><div class="example">
<pre class="example"> <code>&gt;</code> dev = mididevice(&quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot;);

  mididevice connected to
    input: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (1)
    output: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (0)
 </pre></div>


<p><strong>See also:</strong> mididevinfo.
 </p></dd></dl>