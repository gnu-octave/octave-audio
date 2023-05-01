---
layout: "default"
permalink: "/functions/12_midicallback/"
pkg_name: "audio"
pkg_version: "2.0.5"
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
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-midicallback"><span class="category">: </span><span><em><var>oldhandle</var> =</em> <strong>midicallback</strong> <em>(<var>midicontrolsObj</var>, <var>functionHandle</var>)</em><a href='#index-midicallback' class='copiable-anchor'></a></span></dt>
<dt id="index-midicallback-1"><span class="category">: </span><span><em><var>oldhandle</var> =</em> <strong>midicallback</strong> <em>(<var>midicontrolsObj</var>, [])</em><a href='#index-midicallback-1' class='copiable-anchor'></a></span></dt>
<dt id="index-midicallback-2"><span class="category">: </span><span><em><var>currhandle</var> =</em> <strong>midicallback</strong> <em>(<var>midicontrolsObj</var>)</em><a href='#index-midicallback-2' class='copiable-anchor'></a></span></dt>
<dd><p>Get, set or clear the midicontrol object callback.
</p> 
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>midicontrolObj</var> - control object created using midicontrols.
</p>
<p><var>functionHandle</var> - function handle to set for call back. If it is [],
 the callback function will be cleared.
</p>
<p><strong>NOTE</strong>: currently anonymous functions will not work.
</p>
<p><strong>NOTE</strong>: callbacks should be cleared before losing all references to the midicontrols 
 object.
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>oldhandle</var> The previously set midicallback function handle when setting a new callback.
</p>
<p><var>currhandle</var> The current set midicallback function handle.
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Set a callback on a midicontrols object
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001)
 function dispCallback(ctrl),disp(midiread(ctrl)),endfunction;
 midicallback(ctrl, @dispCallback);
 </pre></div>

<p>Clear the callback on a midicontrols object
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001)
 midicallback(ctrl, []);
 </pre></div>

<p>Get the current callback on a midicontrols object
 </p><div class="example">
<pre class="example"> ctrl = midicontrols(2001)
 cb = midicallback(ctrl);
 </pre></div>


<p><strong>See also:</strong> midicontrols, midisync, midiread.
 </p></dd></dl>