---
layout: "default"
permalink: "/functions/11_mididevinfo/"
pkg_name: "audio"
pkg_version: "2.0.7"
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
<dt class="deftypefn" id="index-mididevinfo"><span class="category-def">: </span><span><code class="def-type"><var class="var">devlist</var> =</code> <strong class="def-name">mididevinfo</strong> <code class="def-code-arguments">()</code><a class="copiable-link" href='#index-mididevinfo'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-mididevinfo-1"><span class="category-def">: </span><span><strong class="def-name">mididevinfo</strong> <code class="def-code-arguments">()</code><a class="copiable-link" href='#index-mididevinfo-1'></a></span></dt>
<dd><p>Retrieve the midi devices detected within the system.
</p>
<p>The list will be stored with variable <var class="var">devlist</var> as either a input or output device.
 If no output variable is provided, the devices will be displayed.
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">devlist</var> - a structure containing the midi device information
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Display the known devices of the system.
 </p><div class="example">
<pre class="example-preformatted"> <code class="command">&gt;</code> mididevinfo

 MIDI devices available
 ID Direction Interface  Name
  0 output    Alsa       Midi Through:Midi Through Port-0 14:0
  1 output    Alsa       Ensoniq AudioPCI:ES1371 16:0
  2 output    Alsa       SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0
  3 input     Alsa       Midi Through:Midi Through Port-0 14:0
  4 input     Alsa       Ensoniq AudioPCI:ES1371 16:0
  5 input     Alsa       SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0 
 </pre></div>

<p>Assign variable <var class="var">mididevices</var> with the values from the known devices
 </p><div class="example">
<pre class="example-preformatted"> <code class="command">&gt;</code> mididevices = mididevinfo

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


<p><strong class="strong">See also:</strong> mididevice.
 </p></dd></dl>