---
layout: "default"
permalink: "/functions/12_midicallback/"
pkg_name: "audio"
pkg_version: "2.0.6"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midicallback"
category: "MIDI Controller Interface"
func_name: "midicallback"
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
<dt class="deftypefn" id="index-midicallback"><span class="category-def">: </span><span><code class="def-type"><var class="var">oldhandle</var> =</code> <strong class="def-name">midicallback</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>, <var class="var">functionHandle</var>)</code><a class="copiable-link" href='#index-midicallback'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midicallback-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">oldhandle</var> =</code> <strong class="def-name">midicallback</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>, [])</code><a class="copiable-link" href='#index-midicallback-1'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midicallback-2"><span class="category-def">: </span><span><code class="def-type"><var class="var">currhandle</var> =</code> <strong class="def-name">midicallback</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>)</code><a class="copiable-link" href='#index-midicallback-2'></a></span></dt>
<dd><p>Get, set or clear the midicontrol object callback.
</p> 
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">midicontrolObj</var> - control object created using midicontrols.
</p>
<p><var class="var">functionHandle</var> - function handle to set for call back. If it is [],
 the callback function will be cleared.
</p>
<p><strong class="strong">NOTE</strong>: currently anonymous functions will not work.
</p>
<p><strong class="strong">NOTE</strong>: callbacks should be cleared before losing all references to the midicontrols 
 object.
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">oldhandle</var> The previously set midicallback function handle when setting a new callback.
</p>
<p><var class="var">currhandle</var> The current set midicallback function handle.
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Set a callback on a midicontrols object
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 function dispCallback(ctrl),disp(midiread(ctrl)),endfunction;
 midicallback(ctrl, @dispCallback);
 </pre></div>

<p>Clear the callback on a midicontrols object
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 midicallback(ctrl, []);
 </pre></div>

<p>Get the current callback on a midicontrols object
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 cb = midicallback(ctrl);
 </pre></div>


<p><strong class="strong">See also:</strong> midicontrols, midisync, midiread.
 </p></dd></dl>