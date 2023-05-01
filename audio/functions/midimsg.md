---
layout: "default"
permalink: "/functions/7_midimsg/"
pkg_name: "audio"
pkg_version: "2.0.5"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - midimsg"
category: "MIDI Device Interface"
func_name: "midimsg"
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
<dt id="index-midimsg"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(0)</em><a href='#index-midimsg' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-1"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(<var>type</var> ....)</em><a href='#index-midimsg-1' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-2"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;note&quot;, <var>channel</var>, <var>note</var>, <var>velocity</var>, <var>duration</var>, <var>timestamp</var>)</em><a href='#index-midimsg-2' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-3"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;noteon&quot;, <var>channel</var>, <var>note</var>, <var>velocity</var>, <var>timestamp</var>)</em><a href='#index-midimsg-3' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-4"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;noteoff&quot;, <var>channel</var>, <var>note</var>, <var>velocity</var>, <var>timestamp</var>)</em><a href='#index-midimsg-4' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-5"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;programchange&quot;, <var>channel</var>, <var>prog</var>, <var>timestamp</var>)</em><a href='#index-midimsg-5' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-6"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;controlchange&quot;, <var>channel</var>, <var>ccnum</var>, <var>ccval</var>, <var>timestamp</var>)</em><a href='#index-midimsg-6' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-7"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;polykeypressure&quot;, <var>channel</var>, <var>note</var>, <var>keypressure</var>, <var>timestamp</var>)</em><a href='#index-midimsg-7' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-8"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;channelpressure&quot;, <var>channel</var>, <var>chanpressure</var>, <var>timestamp</var>)</em><a href='#index-midimsg-8' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-9"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;localcontrol&quot;, <var>channel</var>, <var>localcontrol</var>, <var>timestamp</var>)</em><a href='#index-midimsg-9' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-10"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;pitchbend&quot;, <var>channel</var>, <var>pitchchange</var>, <var>timestamp</var>)</em><a href='#index-midimsg-10' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-11"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;polyon&quot;, <var>channel</var>, <var>timestamp</var>)</em><a href='#index-midimsg-11' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-12"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;monoon&quot;, <var>channel</var>, <var>monochannels</var>, <var>timestamp</var>)</em><a href='#index-midimsg-12' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-13"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;omnion&quot;, <var>channel</var>, <var>timestamp</var>)</em><a href='#index-midimsg-13' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-14"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;omnioff&quot;, <var>channel</var>, <var>timestamp</var>)</em><a href='#index-midimsg-14' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-15"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;allsoundoff&quot;, <var>channel</var>, <var>timestamp</var>)</em><a href='#index-midimsg-15' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-16"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;allnotesoff&quot;, <var>channel</var>, <var>timestamp</var>)</em><a href='#index-midimsg-16' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-17"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;resetallcontrollers&quot;, <var>channel</var>, <var>timestamp</var>)</em><a href='#index-midimsg-17' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-18"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;start&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-18' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-19"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;stop&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-19' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-20"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;continue&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-20' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-21"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;systemreset&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-21' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-22"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;activesensing&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-22' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-23"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;timingclock&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-23' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-24"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;systemexclusive&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-24' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-25"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;systemexclusive&quot;, <var>bytes</var>, <var>timestamp</var>)</em><a href='#index-midimsg-25' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-26"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;eox&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-26' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-27"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;data&quot;, <var>bytes</var>, <var>timestamp</var>)</em><a href='#index-midimsg-27' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-28"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;songselect&quot;, <var>song</var>, <var>timestamp</var>)</em><a href='#index-midimsg-28' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-29"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;songpositionpointer&quot;, <var>songposition</var>, <var>timestamp</var>)</em><a href='#index-midimsg-29' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-30"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;tunerequest&quot;, <var>timestamp</var>)</em><a href='#index-midimsg-30' class='copiable-anchor'></a></span></dt>
<dt id="index-midimsg-31"><span class="category">: </span><span><em><var>msg</var> =</em> <strong>midimsg</strong> <em>(&quot;miditimecodequarterframe&quot;, <var>timeseq</var>, <var>timevalue</var>, <var>timestamp</var>)</em><a href='#index-midimsg-31' class='copiable-anchor'></a></span></dt>
<dd><p>Create a midimsg object
</p>
<p>If the input parameter is 0, create an empty midi message object
 Otherwise the first variable is the type of message to create, followed by the additional
 parameters for the message.
</p>
<p>For each message type, the timestamp value is optional.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<p><var>type</var> - string message type or a midimsgtype.<br>
 <var>timestamp</var> - optional seconds time stamp for the event<br>
 <var>channel</var> - the channel to use for the message (1..16)<br>
 <var>note</var> - the value of the note to play/stop<br>
 <var>velocity</var> - the velocity value for a note on/off, with 0 stopping a note from sounding.<br>
 <var>duration</var> - seconds between starting and stopping a note when created a &rsquo;note&rsquo; message.<br>
 <var>prog</var> - program number when doing a program change message.<br>
 <var>ccnum</var> - control change control number.<br>
 <var>ccval</var> - control change control value.<br>
 <var>keypressure</var> - key pressure value when creating a key pressure message.<br>
 <var>chanpressure</var> - channel pressure value when creating a channelpressure message.<br>
 <var>pitchchange</var> - pitch change value when creating a pitch bend message.<br>
 <var>localcontrol</var> - boolean value when creating a localcontrol message.<br>
 <var>monochannels</var> - channels specified for a mono on message.<br>
 <var>bytes</var> - array of data in range of 0 to 127 specified as part of a data message or
 system exclusive message.<br>
 <var>song</var> - song selection number for a song selection message.<br>
 <var>songposition</var> - song position value for a song position message.<br>
 <var>timeseq</var> - timecode sequence number for a miditimecodequarterframe message.<br>
 <var>timevalue</var> - timecode value number for a miditimecodequarterframe message.<br>
</p>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p><var>msg</var> - a midimsg object containing the midi data of the message
</p>
<span id="Properties"></span><h4 class="subsubheading">Properties</h4>
<p><var>timestamp</var> - timestamp of the message, or an array or timestamps if the the message is a
 compound message.<br>
 <var>msgbytes</var> - the raw message bytes that make up the MIDI message.<br>
 <var>nummsgbytes</var> - the number of message bytes that make up the MIDI message.<br>
 <var>type</var> - string or midimsgtype that represents the message type.<br>
 <var>channel</var> - the channel number for message.<br>
 <var>note</var> - the note value for message (Only valid for noteon/off and polykeypressure).<br>
 <var>velocity</var> - the velocity value for message (Only valid for noteon/off).<br>
 <var>keypressure</var> - the keypressure value for message (Only valid for polykeypressure).<br>
 <var>channelpressure</var> - the chanpressure value for message (Only valid for channelpressure).<br>
 <var>localcontrol</var> - the localcontrol value for message (Only valid for localcontrol messages).<br>
 <var>monochannels</var> - channels specified for a mono on message.<br>
 <var>program</var> - program number specified for a program change message.<br>
 <var>ccnumber</var> - control change number specified for a control change message.<br>
 <var>ccvalue</var> - control change value specified for a control change message.<br>
 <var>song</var> - song number for a song selection message.<br>
 <var>songposition</var> - song position value for a song position message.<br>
 <var>pitchchange</var> - pitch change value for a pitch bend message.<br>
 <var>timecodesequence</var> - timecode sequence number for a miditimecodequarterframe message.<br>
 <var>timecodevalue</var> - timecode value number for a miditimecodequarterframe message.<br>
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Create a note on/off pair with a duration of 1.5 seconds
 </p><div class="example">
<pre class="example"> msg = midimsg('note', 1, 60, 100, 1.5)
 </pre></div>

<p>Create a separate note on/off pair with a time between them of 1.5 seconds
 </p><div class="example">
<pre class="example"> msg = [midimsg('noteon', 1, 60, 100, 0), midimsg('noteoff', 1, 60, 0, 1.5)]
 </pre></div>

<p>Create a system reset message
 </p><div class="example">
<pre class="example"> msg = midimsg('systemreset')
 </pre></div>


<p><strong>See also:</strong> midifileread, midisend, midireceive, midimsgtype.
 </p></dd></dl>