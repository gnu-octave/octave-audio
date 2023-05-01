---
layout: "default"
permalink: "/functions/8_midisend/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-midisend"><span class="category">: </span><span><em></em> <strong>midisend</strong> <em>(<var>dev</var>, <var>msg</var>)</em><a href='#index-midisend' class='copiable-anchor'></a></span></dt>
<dt id="index-midisend-1"><span class="category">: </span><span><em></em> <strong>midisend</strong> <em>(<var>dev</var>, ...)</em><a href='#index-midisend-1' class='copiable-anchor'></a></span></dt>
<dd><p>Send a midimsg to a midi device
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>dev</var> - midi device opened using mididevice<br>
 <var>msg</var> - a midi message class with messages to send to the midi device<br>
 If the msg isn&rsquo;t a midimsg class, the input data is expected to be in same format as the inputs to a midimsg object.
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Send a note on/off command to a opened midi device <var>dev</var>
 </p><div class="example">
<pre class="example"> midisend(dev, midimsg(&quot;note&quot;, 1, 60, 100, 2.0));
 </pre></div>
 

<p><strong>See also:</strong> midimsg, mididevice, midireceive.
 </p></dd></dl>