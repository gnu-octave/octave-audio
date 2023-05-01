---
layout: "default"
permalink: "/functions/11_midireceive/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midireceive"
category: "MIDI Device Interface"
func_name: "midireceive"
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
<dt id="index-midireceive"><span class="category">: </span><span><em><var>midimsg</var> =</em> <strong>midireceive</strong> <em>(<var>dev</var>)</em><a href='#index-midireceive' class='copiable-anchor'></a></span></dt>
<dt id="index-midireceive-1"><span class="category">: </span><span><em><var>midimsg</var> =</em> <strong>midireceive</strong> <em>(<var>dev</var>, <var>maxmsg</var>)</em><a href='#index-midireceive-1' class='copiable-anchor'></a></span></dt>
<dd><p>Attempt to receive midi messages from a midi device.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>dev</var> - a octave midi device opened using mididevice.<br>
 <var>maxmsg</var> - Maximum number of messages to retrieve. If not specified, the function will attempt to get all pending.<br>
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>midimsg</var> - a midimsg containing the messages retrieved from the device.<br>
 If no messages are available, <var>midimsg</var> will be empty.
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Open device 0, and poll and display read messages
 </p><div class="example">
<pre class="example"> dev = mididevice(0);
 while true
    mx = midireceive(dev);
    if !isempty(mx)
      % display message
      mx
    endif
 endwhile
 </pre></div>


<p><strong>See also:</strong> mididevice, midisend.
 </p></dd></dl>