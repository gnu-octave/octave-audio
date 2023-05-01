---
layout: "default"
permalink: "/functions/12_midifileread/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifileread"
category: "MIDI File I/O"
func_name: "midifileread"
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
<dt id="index-midifileread"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midifileread</strong> <em>(<var>filename</var>, [propertyname, propertyvalue &hellip;])</em><a href='#index-midifileread' class='copiable-anchor'></a></span></dt>
<dd><p>Read MIDI file into a midimsg
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>filename</var> - filename of file to open.<br>
 <var>propertyname</var>, <var>properyvalue</var> - optional propertyname/value pairs.<br>
</p>
<p>Known property values are:
 </p><dl compact="compact">
<dt><span>includemetaevents</span></dt>
<dd><p>A True/False value to include MetaEvents in the out message list.
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>msg</var> - a midimsg struct containing the messages read from the file<br>
 </p>
<p><strong>See also:</strong> midifileinfo, midimsg.
 </p></dd></dl>