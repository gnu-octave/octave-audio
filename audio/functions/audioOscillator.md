---
layout: "default"
permalink: "/functions/15_audioOscillator/"
pkg_name: "audio"
pkg_version: "2.0.8"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - audioOscillator"
category: "Waveform Generation"
func_name: "audioOscillator"
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
<dt class="deftypefn" id="index-audioOscillator"><span class="category-def">: </span><span><strong class="def-name">audioOscillator</strong><a class="copiable-link" href='#index-audioOscillator'></a></span></dt>
<dd><p>Generate sine, sawtool and square waveforms
 </p></dd></dl>

<h4 class="subheading" id="Methods">Methods</h4>
<dl class="first-deftypefn">
<dt class="deftypefn" id="index-audioOscillator-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">()</code><a class="copiable-link" href='#index-audioOscillator-1'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-audioOscillator-2"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(<var class="var">signalTypeValue</var>)</code><a class="copiable-link" href='#index-audioOscillator-2'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-audioOscillator-3"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(<var class="var">signalTypeValue</var>, <var class="var">frequencyValue</var>)</code><a class="copiable-link" href='#index-audioOscillator-3'></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn" id="index-audioOscillator-4"><span class="category-def">: </span><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(__, <var class="var">propertyname</var>, <var class="var">propertyvalue</var>)</code><a class="copiable-link" href='#index-audioOscillator-4'></a></span></dt>
<dd><p>Create a audioOscillator object
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">signalTypeValue</var> - signal type of &quot;sine&quot; (default), &quot;square&quot;, &quot;sawtooth&quot;.<br>
 <var class="var">frequencyValue</var> - hz frequency value of waveform (default 100).<br>
 <var class="var">propertyname</var>, <var class="var">propertyvalue</var> - properties to set on the object. 
</p>
<p>Known properties are:
 </p><dl class="table">
<dt>SignalType</dt>
<dd><p>signal type of &quot;sine&quot; (default), &quot;square&quot; or &quot;sawtooth&quot;. (readonly)
 </p></dd>
<dt>Frequency</dt>
<dd><p>frequency of the waveform (default 100)
 </p></dd>
<dt>Amplitude</dt>
<dd><p>amplitude of the signal (default 1)
 </p></dd>
<dt>SampleRate</dt>
<dd><p>sample rate of the signal (default 44100)
 </p></dd>
<dt>PhaseOffset</dt>
<dd><p>phase offset of signal 0 (default) - 1 (readonly)
 </p></dd>
<dt>DutyCycle</dt>
<dd><p>dutycycle of the signal 0 - 1 (default 0.5) when signal is a square wave.
 </p></dd>
<dt>SamplePerFrame</dt>
<dd><p>Samples per frame as returned from () (default 512)
 </p></dd>
<dt>MaxSamplePerFrame</dt>
<dd><p>Max samples per frame (default 192000)
 </p></dd>
<dt>DCOffset</dt>
<dd><p>DC Offset of signal (default 0)
 </p></dd>
<dt>Width</dt>
<dd><p>Width of sawtooth (default 1)
 </p></dd>
<dt>OutputDataType</dt>
<dd><p>Output data type of &rsquo;single&rsquo; or &rsquo;double&rsquo; (default &rsquo;double&rsquo;)
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Create a 100 hz sine wave and plot first 512 samples
 </p><div class="example">
<pre class="example-preformatted"> sinosc = audioOscillator
 data = sinosc();
 plot(data);
 </pre></div>

<p>Create a 2 hz square wave with duty cycle of 0.5
 </p><div class="example">
<pre class="example-preformatted"> sqosc = audioOscillator('square', 'DutyCycle', 0.50,  'Frequency', 2);
 </pre></div>

</dd></dl>

<dl class="first-deftypefn">
<dt class="deftypefn" id="index-obj_0028_0029"><span class="category-def">: </span><span><code class="def-type"><var class="var">data</var> =</code> <strong class="def-name"><var class="var">obj</var>()</strong><a class="copiable-link" href='#index-obj_0028_0029'></a></span></dt>
<dd><p>Generate a frame of waveform data from the generator function
</p>
<h4 class="subsubheading" id="Inputs-1">Inputs</h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Outputs-1">Outputs</h4>
<p><var class="var">data</var> - waveform data
 </p></dd></dl>

<dl class="first-deftypefn">
<dt class="deftypefn" id="index-release_0028obj_0029"><span class="category-def">: </span><span><strong class="def-name">release(<var class="var">obj</var>)</strong><a class="copiable-link" href='#index-release_0028obj_0029'></a></span></dt>
<dd><p>Release resources of generator
</p>
<h4 class="subsubheading" id="Inputs-2">Inputs</h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Outputs-2">Outputs</h4>
<p>None
 </p></dd></dl>