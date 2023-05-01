---
layout: "default"
permalink: "/functions/10_ismidifile/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - ismidifile"
category: "MIDI File I/O"
func_name: "ismidifile"
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
<dt id="index-ismidifile"><span class="category">: </span><span><em><var>ismidi</var> =</em> <strong>ismidifile</strong> <em>(<var>filename</var>)</em><a href='#index-ismidifile' class='copiable-anchor'></a></span></dt>
<dd><p>Check if <var>filename</var> is a midi file.
</p>
<p>The function only checks whether it is an existing file and the
 file starts with a valid &rsquo;MThd&rsquo; header.
</p>
<p>Non existing files, or files that do not meet the header criteria will return false.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>filename</var> - filename of file to check.<br>
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>ismidi</var> - true if it is a midi file, false otherwise
</p>

<p><strong>See also:</strong> midifileread, midifilewrite.
 </p></dd></dl>