---
layout: "default"
permalink: "/functions/11_mididevinfo/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - mididevinfo"
category: "MIDI Device Interface"
func_name: "mididevinfo"
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
<dt id="index-mididevinfo"><span class="category">: </span><span><em><var>devlist</var> =</em> <strong>mididevinfo</strong> <em>()</em><a href='#index-mididevinfo' class='copiable-anchor'></a></span></dt>
<dt id="index-mididevinfo-1"><span class="category">: </span><span><em></em> <strong>mididevinfo</strong> <em>()</em><a href='#index-mididevinfo-1' class='copiable-anchor'></a></span></dt>
<dd><p>Retrieve the midi devices detected within the system.
</p>
<p>The list will be stored with variable <var>devlist</var> as either a input or output device.
 If no output variable is provided, the devices will be displayed.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p>None
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>devlist</var> - a structure containing the midi device information
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Display the known devices of the system.
 </p><div class="example">
<pre class="example"> <code>&gt;</code> mididevinfo

 MIDI devices available
 ID Direction Interface  Name
  0 output    Alsa       Midi Through:Midi Through Port-0 14:0
  1 output    Alsa       Ensoniq AudioPCI:ES1371 16:0
  2 output    Alsa       SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
  3 input     Alsa       Midi Through:Midi Through Port-0 14:0
  4 input     Alsa       Ensoniq AudioPCI:ES1371 16:0
  5 input     Alsa       SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0 
 </pre></div>

<p>Assign variable <var>mididevices</var> with the values from the known devices
 </p><div class="example">
<pre class="example"> <code>&gt;</code> mididevices = mididevinfo

 mididevices =
  scalar structure containing the fields:
    input =
    {
      [1,1] =
        scalar structure containing the fields:
          Name = SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
          Interface = Alsa
          ID =  0
    }
    output =
    {
      [1,1] =
        scalar structure containing the fields:
          Name = SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
          Interface = Alsa
          ID =  1
    }
 </pre></div>


<p><strong>See also:</strong> mididevice.
 </p></dd></dl>