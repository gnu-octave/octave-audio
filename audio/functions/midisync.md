---
layout: "default"
permalink: "/functions/8_midisync/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-midisync"><span class="category">: </span><span><em></em> <strong>midisync</strong> <em>(<var>midicontrolsObj</var>)</em><a href='#index-midisync' class='copiable-anchor'></a></span></dt>
<dt id="index-midisync-1"><span class="category">: </span><span><em></em> <strong>midisync</strong> <em>(<var>midicontrolsObj</var>, <var>ctrlvalues</var>)</em><a href='#index-midisync-1' class='copiable-anchor'></a></span></dt>
<dd><p>Send the values of control object to the control, using <var>ctrlvalues</var> values
 if specified instead
</p> 
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>midicontrolObj</var> - control object created using midicontrols<br>
 <var>ctrlvalues</var> - values to send to the controls instead of initial values
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Send sync command to a midicontrols with a ctrlid 2001 to set a value of 1
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001)
 midisync(ctrl, 1);
 </pre></div>


<p><strong>See also:</strong> midicontrols.
 </p></dd></dl>