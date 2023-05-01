---
layout: "default"
permalink: "/functions/9_midiflush/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midiflush"
category: "MIDI Device Interface"
func_name: "midiflush"
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
<dt id="index-midiflush"><span class="category">: </span><span><em></em> <strong>midiflush</strong> <em>(<var>dev</var>)</em><a href='#index-midiflush' class='copiable-anchor'></a></span></dt>
<dd><p>Flush the receive buffers on a midi device
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>dev</var> - midi device opened using mididevice<br>
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Flush a midi device
 </p><div class="example">
<pre class="example"> midiflush(dev);
 </pre></div>
 

<p><strong>See also:</strong> mididevice, midireceive.
 </p></dd></dl>