---
layout: "default"
permalink: "/functions/6_midiid/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-midiid"><span class="category">: </span><span><em>[<var>ctrlid</var>, <var>dev</var>] =</em> <strong>midiid</strong> <em>()</em><a href='#index-midiid' class='copiable-anchor'></a></span></dt>
<dd><p>Scan for control messages from midi devices to get the id of the device
</p> 
<p>Function will display a prompt for the user to move the midi control and return when
 a control messages is detected or ctrl-C is pressed.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p>None
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>ctrlid</var> - control id made from the controller channel * 1000 + controller number.<br>
 <var>dev</var> = name of the midi device the controller was detected on.
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Monitor midi devices for first moving controller
 </p><div class="example">
<pre class="example"> [ctrlid, devname] = midiid()
 </pre></div>


<p><strong>See also:</strong> mididevinfo, midicontrols.
 </p></dd></dl>