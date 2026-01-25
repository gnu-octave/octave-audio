---
layout: "default"
permalink: "/functions/7_midimsg/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midimsg"
category: "Domain Conversion"
func_name: "midimsg"
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
  subitems:
- id: "25_MIDIControllerInterface"
  name: "&nbsp;&nbsp;MIDI Controller Interface"
  url: "/functions/#25_MIDIControllerInterface"
  subitems:
- id: "13_MIDIFileIO"
  name: "&nbsp;&nbsp;MIDI File I/O"
  url: "/functions/#13_MIDIFileIO"
  subitems:
- id: "12_Enumerations"
  name: "&nbsp;&nbsp;Enumerations"
  url: "/functions/#12_Enumerations"
  subitems:
- id: "19_WaveformGeneration"
  name: "&nbsp;&nbsp;Waveform Generation"
  url: "/functions/#19_WaveformGeneration"
  subitems:
- id: "17_DomainConversion"
  name: "&nbsp;&nbsp;Domain Conversion"
  url: "/functions/#17_DomainConversion"
  subitems:
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midimsg"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(0)</code><a class="copiable-link" href="#index-midimsg"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">()</code><a class="copiable-link" href="#index-midimsg-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-2"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(<var class="var">type</var> ....)</code><a class="copiable-link" href="#index-midimsg-2"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-3"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;note&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">velocity</var>, <var class="var">duration</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-3"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-4"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;noteon&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">velocity</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-4"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-5"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;noteoff&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">velocity</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-5"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-6"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;programchange&quot;, <var class="var">channel</var>, <var class="var">prog</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-6"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-7"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;controlchange&quot;, <var class="var">channel</var>, <var class="var">ccnum</var>, <var class="var">ccval</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-7"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-8"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;polykeypressure&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">keypressure</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-8"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-9"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;channelpressure&quot;, <var class="var">channel</var>, <var class="var">chanpressure</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-9"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-10"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;localcontrol&quot;, <var class="var">channel</var>, <var class="var">localcontrol</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-10"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-11"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;pitchbend&quot;, <var class="var">channel</var>, <var class="var">pitchchange</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-11"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-12"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;polyon&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-12"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-13"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;monoon&quot;, <var class="var">channel</var>, <var class="var">monochannels</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-13"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-14"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;omnion&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-14"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-15"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;omnioff&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-15"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-16"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;allsoundoff&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-16"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-17"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;allnotesoff&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-17"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-18"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;resetallcontrollers&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-18"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-19"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;start&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-19"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-20"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;stop&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-20"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-21"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;continue&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-21"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-22"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;systemreset&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-22"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-23"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;activesensing&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-23"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-24"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;timingclock&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-24"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-25"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;systemexclusive&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-25"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-26"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;systemexclusive&quot;, <var class="var">bytes</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-26"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-27"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;eox&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-27"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-28"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;data&quot;, <var class="var">bytes</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-28"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-29"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;songselect&quot;, <var class="var">song</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-29"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-30"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;songpositionpointer&quot;, <var class="var">songposition</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-30"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-31"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;tunerequest&quot;, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-31"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-32"><span class="category-def">: </span><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;miditimecodequarterframe&quot;, <var class="var">timeseq</var>, <var class="var">timevalue</var>, <var class="var">timestamp</var>)</code><a class="copiable-link" href="#index-midimsg-32"></a></span></dt>
<dd><p>Create a midimsg object
</p>
<p>If the input parameter is 0, create an empty midi message object
 Otherwise the first variable is the type of message to create, followed by the additional
 parameters for the message.
</p>
<p>For each message type, the timestamp value is optional.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<p><var class="var">type</var> - string message type or a midimsgtype.<br>
 <var class="var">timestamp</var> - optional seconds time stamp for the event<br>
 <var class="var">channel</var> - the channel to use for the message (1..16)<br>
 <var class="var">note</var> - the value of the note to play/stop<br>
 <var class="var">velocity</var> - the velocity value for a note on/off, with 0 stopping a note from sounding.<br>
 <var class="var">duration</var> - seconds between starting and stopping a note when created a &rsquo;note&rsquo; message.<br>
 <var class="var">prog</var> - program number when doing a program change message.<br>
 <var class="var">ccnum</var> - control change control number.<br>
 <var class="var">ccval</var> - control change control value.<br>
 <var class="var">keypressure</var> - key pressure value when creating a key pressure message.<br>
 <var class="var">chanpressure</var> - channel pressure value when creating a channelpressure message.<br>
 <var class="var">pitchchange</var> - pitch change value when creating a pitch bend message.<br>
 <var class="var">localcontrol</var> - boolean value when creating a localcontrol message.<br>
 <var class="var">monochannels</var> - channels specified for a mono on message.<br>
 <var class="var">bytes</var> - array of data in range of 0 to 127 specified as part of a data message or
 system exclusive message.<br>
 <var class="var">song</var> - song selection number for a song selection message.<br>
 <var class="var">songposition</var> - song position value for a song position message.<br>
 <var class="var">timeseq</var> - timecode sequence number for a miditimecodequarterframe message.<br>
 <var class="var">timevalue</var> - timecode value number for a miditimecodequarterframe message.<br>
</p>
<p>In the case where no inputs are provides, a midimsg &rsquo;data&rsquo; message is created.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p><var class="var">msg</var> - a midimsg object containing the midi data of the message
</p>
<h4 class="subsubheading" id="Properties"><span>Properties<a class="copiable-link" href="#Properties"></a></span></h4>
<p><var class="var">timestamp</var> - timestamp of the message, or an array or timestamps if the the message is a
 compound message.<br>
 <var class="var">msgbytes</var> - the raw message bytes that make up the MIDI message.<br>
 <var class="var">nummsgbytes</var> - the number of message bytes that make up the MIDI message.<br>
 <var class="var">type</var> - string or midimsgtype that represents the message type.<br>
 <var class="var">channel</var> - the channel number for message.<br>
 <var class="var">note</var> - the note value for message (Only valid for noteon/off and polykeypressure).<br>
 <var class="var">velocity</var> - the velocity value for message (Only valid for noteon/off).<br>
 <var class="var">keypressure</var> - the keypressure value for message (Only valid for polykeypressure).<br>
 <var class="var">channelpressure</var> - the chanpressure value for message (Only valid for channelpressure).<br>
 <var class="var">localcontrol</var> - the localcontrol value for message (Only valid for localcontrol messages).<br>
 <var class="var">monochannels</var> - channels specified for a mono on message.<br>
 <var class="var">program</var> - program number specified for a program change message.<br>
 <var class="var">ccnumber</var> - control change number specified for a control change message.<br>
 <var class="var">ccvalue</var> - control change value specified for a control change message.<br>
 <var class="var">song</var> - song number for a song selection message.<br>
 <var class="var">songposition</var> - song position value for a song position message.<br>
 <var class="var">pitchchange</var> - pitch change value for a pitch bend message.<br>
 <var class="var">timecodesequence</var> - timecode sequence number for a miditimecodequarterframe message.<br>
 <var class="var">timecodevalue</var> - timecode value number for a miditimecodequarterframe message.<br>
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Create a note on/off pair with a duration of 1.5 seconds
 </p><div class="example">
<pre class="example-preformatted"> msg = midimsg('note', 1, 60, 100, 1.5)
 </pre></div>

<p>Create a separate note on/off pair with a time between them of 1.5 seconds
 </p><div class="example">
<pre class="example-preformatted"> msg = [midimsg('noteon', 1, 60, 100, 0), midimsg('noteoff', 1, 60, 0, 1.5)]
 </pre></div>

<p>Create a system reset message
 </p><div class="example">
<pre class="example-preformatted"> msg = midimsg('systemreset')
 </pre></div>


<p><strong class="strong">See also:</strong> midifileread, midisend, midireceive, midimsgtype.
 </p></dd></dl>