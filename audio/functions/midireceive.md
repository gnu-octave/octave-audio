---
layout: "default"
permalink: "/functions/11_midireceive/"
pkg_name: "audio"
pkg_version: "2.0.9"
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
- id: "17_DomainConversion"
  name: "&nbsp;&nbsp;Domain Conversion"
  url: "/functions/#17_DomainConversion"
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn">
<dt class="deftypefn" id="index-midireceive"><span class="category-def">: </span><span><code class="def-type"><var class="var">midimsg</var> =</code> <strong class="def-name">midireceive</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code><a class="copiable-link" href="#index-midireceive"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midireceive-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">midimsg</var> =</code> <strong class="def-name">midireceive</strong> <code class="def-code-arguments">(<var class="var">dev</var>, <var class="var">maxmsg</var>)</code><a class="copiable-link" href="#index-midireceive-1"></a></span></dt>
<dd><p>Attempt to receive midi messages from a midi device.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">dev</var> - a octave midi device opened using mididevice.<br>
 <var class="var">maxmsg</var> - Maximum number of messages to retrieve. If not specified, the function will attempt to get all pending.<br>
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">midimsg</var> - a midimsg containing the messages retrieved from the device.<br>
 If no messages are available, <var class="var">midimsg</var> will be empty.
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Open device 0, and poll and display read messages
 </p><div class="example">
<pre class="example-preformatted"> dev = mididevice(0);
 while true
    mx = midireceive(dev);
    if !isempty(mx)
      % display message
      mx
    endif
 endwhile
 </pre></div>


<p><strong class="strong">See also:</strong> mididevice, midisend.
 </p></dd></dl>