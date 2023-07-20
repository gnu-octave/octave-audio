---
layout: "default"
permalink: "/functions/12_midicontrols/"
pkg_name: "audio"
pkg_version: "2.0.6"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midicontrols"
category: "MIDI Controller Interface"
func_name: "midicontrols"
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
<dt class="deftypefn" id="index-midicontrols"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">()</code><a class="copiable-link" href='#index-midicontrols'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midicontrols-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">(<var class="var">ctrlid</var>)</code><a class="copiable-link" href='#index-midicontrols-1'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midicontrols-2"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">(<var class="var">ctrlid</var>, <var class="var">initialvalues</var>)</code><a class="copiable-link" href='#index-midicontrols-2'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-midicontrols-3"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">(__, <var class="var">propertyname</var>, <var class="var">propertyvalue</var>)</code><a class="copiable-link" href='#index-midicontrols-3'></a></span></dt>
<dd><p>Create a midi controls object
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">ctrlid</var> - single control id or array of control ids to monitor, or [] to use any controller.<br>
 <var class="var">initialvalues</var> - initial values to use for controls. It should be the same size as <var class="var">ctrlid</var><br>
 <var class="var">propertyname</var>, <var class="var">propertyvalue</var> - properties to set on the controller. If a device is not specified
 the value from getpref(&quot;midi&quot;, &quot;DefaultDevice&quot;, 0) will be used.<br>
</p>

<p>Known properties are:
 </p><dl class="table">
<dt>mididevice</dt>
<dd><p>name of the mididevice to monitor.
 </p></dd>
<dt>outputmode</dt>
<dd><p>the scaling mode for values: &rsquo;rawmidi&rsquo; will return values between 0 .. 127,
 &rsquo;normalized&rsquo; will use values between 0 .. 1.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">obj</var> - returns a midicontrols object
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Create a midicontrols object monitoring control id 2001 on the default midi device 
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 </pre></div>

<p>Create a midicontrols object monitoring control id 2001 on a a non default device
 </p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001, 'mididevice', 1)
 </pre></div>


<p><strong class="strong">See also:</strong> midiread, midisync.
 </p></dd></dl>