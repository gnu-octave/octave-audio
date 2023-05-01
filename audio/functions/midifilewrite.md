---
layout: "default"
permalink: "/functions/13_midifilewrite/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifilewrite"
category: "MIDI File I/O"
func_name: "midifilewrite"
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
<dt id="index-midifilewrite"><span class="category">: </span><span><em></em> <strong>midifilewrite</strong> <em>(<var>filename</var>, <var>msgs</var>)</em><a href='#index-midifilewrite' class='copiable-anchor'></a></span></dt>
<dt id="index-midifilewrite-1"><span class="category">: </span><span><em></em> <strong>midifilewrite</strong> <em>(<var>filename</var>, <var>msgs</var>, <var>optionname</var>, <var>optionvalue</var>)</em><a href='#index-midifilewrite-1' class='copiable-anchor'></a></span></dt>
<dd><p>Write a midifile
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>filename</var> - filename of file to open.<br>
 <var>msg</var> - a midimsg struct or a cell array of midimsg containing data to write to file<br>
 <var>optionname</var>, <var>optionvalue</var> - option value/name pairs<br>
</p>
<p>Known options are:
 </p><dl compact="compact">
<dt><span>format</span></dt>
<dd><p>MIDI file format number. (0 (default), 1, 2)
 </p></dd>
</dl>

<p>Where format is 0, if a cell array is passed to midifilewrite, the midimsg values will
 be concatenated together before saving.
</p>
<p>Were format is not 0, the cell array is treated as tracks of misimsg.
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
 </p>
<p><strong>See also:</strong> midifileread, midimsg.
 </p></dd></dl>