---
layout: "default"
permalink: "/functions/12_midicontrols/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-midicontrols"><span class="category">: </span><span><em><var>obj</var> =</em> <strong>midicontrols</strong> <em>()</em><a href='#index-midicontrols' class='copiable-anchor'></a></span></dt>
<dt id="index-midicontrols-1"><span class="category">: </span><span><em><var>obj</var> =</em> <strong>midicontrols</strong> <em>(<var>ctrlid</var>)</em><a href='#index-midicontrols-1' class='copiable-anchor'></a></span></dt>
<dt id="index-midicontrols-2"><span class="category">: </span><span><em><var>obj</var> =</em> <strong>midicontrols</strong> <em>(<var>ctrlid</var>, <var>initialvalues</var>)</em><a href='#index-midicontrols-2' class='copiable-anchor'></a></span></dt>
<dt id="index-midicontrols-3"><span class="category">: </span><span><em><var>obj</var> =</em> <strong>midicontrols</strong> <em>(__, <var>propertyname</var>, <var>propertyvalue</var>)</em><a href='#index-midicontrols-3' class='copiable-anchor'></a></span></dt>
<dd><p>Create a midi controls object
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>ctrlid</var> - single control id or array of control ids to monitor, or [] to use any controller.<br>
 <var>initialvalues</var> - initial values to use for controls. It should be the same size as <var>ctrlid</var><br>
 <var>propertyname</var>, <var>propertyvalue</var> - properties to set on the controller. If a device is not specified
 the value from getpref(&quot;midi&quot;, &quot;DefaultDevice&quot;, 0) will be used.<br>
</p>

<p>Known properties are:
 </p><dl compact="compact">
<dt><span>mididevice</span></dt>
<dd><p>name of the mididevice to monitor.
 </p></dd>
<dt><span>outputmode</span></dt>
<dd><p>the scaling mode for values: &rsquo;rawmidi&rsquo; will return values between 0 .. 127,
 &rsquo;normalized&rsquo; will use values between 0 .. 1.
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>obj</var> - returns a midicontrols object
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Create a midicontrols object monitoring control id 2001 on the default midi device 
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001)
 </pre></div>

<p>Create a midicontrols object monitoring control id 2001 on a a non default device
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001, 'mididevice', 1)
 </pre></div>


<p><strong>See also:</strong> midiread, midisync.
 </p></dd></dl>