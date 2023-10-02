---
layout: "default"
permalink: "/functions/11_midimsgtype/"
pkg_name: "audio"
pkg_version: "2.0.8"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midimsgtype"
category: "Enumerations"
func_name: "midimsgtype"
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
<dt class="deftypefn" id="index-midimsgtype"><span class="category-def">: </span><span><strong class="def-name">midimsgtype</strong><a class="copiable-link" href='#index-midimsgtype'></a></span></dt>
<dd><p>A midimsg type enumeration for values of the midimsg type.
</p>
<p>Enumeration values are:
 </p><table class="multitable">
<tbody><tr><td width="20%">Data</td><td width="40%">Stop</td><td width="30%">SongPositionPointer</td></tr>
<tr><td width="20%">PolyOn</td><td width="40%">PolyKeyPressure</td><td width="30%">NoteOff</td></tr>
<tr><td width="20%">EOX</td><td width="40%">ActiveSensing</td><td width="30%">SongSelect</td></tr>
<tr><td width="20%">MonoOn</td><td width="40%">ChannelPressure</td><td width="30%">ControlChange</td></tr>
<tr><td width="20%">TimingClock</td><td width="40%">SystemReset</td><td width="30%">AllSoundOff</td></tr>
<tr><td width="20%">OmniOn</td><td width="40%">PitchBend</td><td width="30%">ProgramChange</td></tr>
<tr><td width="20%">Start</td><td width="40%">TuneRequest</td><td width="30%">ResetAllControllers</td></tr>
<tr><td width="20%">OmniOff</td><td width="40%">Undefined</td><td width="30%">SystemExclusive</td></tr>
<tr><td width="20%">Continue</td><td width="40%">MIDITimeCodeQuarterFrame</td><td width="30%">LocalControl</td></tr>
<tr><td width="20%">AllNotesOff</td><td width="40%">MetaEvent</td><td width="30%"></td></tr>
</tbody>
</table>


<p>The enumeration value can be used instead of a string in midimsg creation.
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Use both a string and a midimsgtype for the type parameter of a midimsg.
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 # both statements are equivalent
 msg = midimsg('NoteOn', 1, 60, 100);
 msg = midimsg(midimsgtype.NoteOn, 1, 60, 100);
 </code>
 </pre></div>


<p><strong class="strong">See also:</strong> midimsg.
 </p></dd></dl>