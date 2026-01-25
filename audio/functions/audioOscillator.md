---
layout: "default"
permalink: "/functions/15_audioOscillator/"
pkg_name: "audio"
pkg_version: "2.0.10"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - audioOscillator"
category: "Domain Conversion"
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
<dt class="deftypefn def-line" id="index-audioOscillator"><span><strong class="def-name">audioOscillator</strong></span></dt>
<dd><p>Generate sine, sawtool and square waveforms
 </p></dd></dl>

<h4 class="subheading" id="Methods"><span>Methods</span></h4>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-audioOscillator-1"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">()</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioOscillator-2"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(<var class="var">signalTypeValue</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioOscillator-3"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(<var class="var">signalTypeValue</var>, <var class="var">frequencyValue</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioOscillator-4"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(__, <var class="var">propertyname</var>, <var class="var">propertyvalue</var>)</code></span></dt>
<dd><p>Create a audioOscillator object
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
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

<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Examples"><span>Examples</span></h4>
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

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-obj_0028_0029"><span><code class="def-type"><var class="var">data</var> =</code> <strong class="def-name"><var class="var">obj</var>()</strong></span></dt>
<dd><p>Generate a frame of waveform data from the generator function
</p>
<h4 class="subsubheading" id="Inputs-1"><span>Inputs</span></h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Outputs-1"><span>Outputs</span></h4>
<p><var class="var">data</var> - waveform data
 </p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-release_0028obj_0029"><span><strong class="def-name">release(<var class="var">obj</var>)</strong></span></dt>
<dd><p>Release resources of generator
</p>
<h4 class="subsubheading" id="Inputs-2"><span>Inputs</span></h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Outputs-2"><span>Outputs</span></h4>
<p>None
 </p></dd></dl>