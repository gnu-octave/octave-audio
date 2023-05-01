---
layout: "default"
permalink: "/functions/8_midiread/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-midiread"><span class="category">: </span><span><em><var>val</var> =</em> <strong>midiread</strong> <em>(<var>midicontrolsObj</var>)</em><a href='#index-midiread' class='copiable-anchor'></a></span></dt>
<dd><p>Read current values of midi controls
</p> 
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>midicontrolObj</var> - control object created using midicontrols<br>
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>val</var> single value or array of current values from the midi device.
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Read current value of midicontrols with a ctrlid 2001 on the default midi device.
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001)
 val = midiread(ctrl);
 </pre></div>

<p>Read current value of midicontrols with a ctrlid 2001 on a non default midi device.
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001, 'mididevice', 1)
 val = midiread(ctrl);
 </pre></div>


<p><strong>See also:</strong> midicontrols, midisync.
 </p></dd></dl>