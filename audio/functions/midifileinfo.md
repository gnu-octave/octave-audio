---
layout: "default"
permalink: "/functions/12_midifileinfo/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midifileinfo"
category: "MIDI File I/O"
func_name: "midifileinfo"
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
<dt id="index-midifileinfo"><span class="category">: </span><span><em><var>info</var> =</em> <strong>midifileinfo</strong> <em>(<var>filename</var>)</em><a href='#index-midifileinfo' class='copiable-anchor'></a></span></dt>
<dd><p>Read MIDI file and display information about the tracks and data
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>filename</var> - filename of file to open.<br>
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>info</var> - structure of the midi file data
 with the following fields:<br>
 </p><dl compact="compact">
<dt><span>filename</span></dt>
<dd><p>the name of the file
 </p></dd>
<dt><span>header</span></dt>
<dd><p>The header block information
 </p></dd>
<dt><span>track</span></dt>
<dd><p>An array of tracks read from the file
 </p></dd>
<dt><span>other</span></dt>
<dd><p>An array of non-track midi blocks read from the file
 </p></dd>
</dl>

<p><strong>See also:</strong> midifileread.
 </p></dd></dl>