---
layout: "default"
permalink: "/functions/19_dspAudioFileReader/"
pkg_name: "audio"
pkg_version: "2.0.12"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - dsp.AudioFileReader"
category: "Audio File I/O"
func_name: "dsp.AudioFileReader"
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
- id: "14_AudioFileIO"
  name: "&nbsp;&nbsp;Audio File I/O"
  url: "/functions/#14_AudioFileIO"
  subitems:
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-dsp_002eAudioFileReader"><span><strong class="def-name">dsp.AudioFileReader</strong></span></dt>
<dd><p>Read audio samples from a audio file
 </p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-AudioFileReader"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">AudioFileReader</strong> <code class="def-code-arguments">()</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-AudioFileReader-1"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">AudioFileReader</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-AudioFileReader-2"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">AudioFileReader</strong> <code class="def-code-arguments">(<var class="var">propertyname</var>, <var class="var">propertyvalue</var> &hellip;)</code></span></dt>
<dd><p>Create a AudioFileReader object
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<p><var class="var">filename</var> - filename to read<br>
 <var class="var">propertyname</var>, <var class="var">propertyvalue</var> - properties to set on the object.
</p>
<h4 class="subsubheading" id="Properties"><span>Properties</span></h4>
<p>Known creation properties are:
 </p><dl class="table">
<dt>Filename</dt>
<dd><p>Filename to load data from.
 </p></dd>
<dt>OutputDataType</dt>
<dd><p>Output data type of &rsquo;single&rsquo; or &rsquo;double&rsquo; (default &rsquo;double&rsquo;)
 </p></dd>
<dt>SamplesPerFrame</dt>
<dd><p>Samples per frame as returned from () (default 1024)
 </p></dd>
<dt>PlayCount</dt>
<dd><p>Number of times to play the file (default 1)
 </p></dd>
<dt>ReadRange</dt>
<dd><p>Vector start, stop range of the samples within the file (default [1  Inf])
 </p></dd>
</dl>

<p>Read-only properties accessable after file is loaded:
 </p><dl class="table">
<dt>SampleRate</dt>
<dd><p>sample rate of the data
 </p></dd>
<dt>NumChannels</dt>
<dd><p>Number of channels in the data
 </p></dd>
<dt>TotalSamples</dt>
<dd><p>Number of samples in the data
 </p></dd>
<dt>TotalDuration</dt>
<dd><p>Approximate time of the data during playback
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<p><var class="var">obj</var> - AudioFileReader object
</p>
<h4 class="subsubheading" id="Examples"><span>Examples</span></h4>
<p>Create a audio reader for reading in a sample file, and then extract each from ntil the file is
 completed.
 </p><div class="example">
<pre class="example-preformatted"> afr = dsp.AudioFileReader(&quot;sample.wav&quot;)
 while ! isDone(afr)
   data = afr();
 endwhile
 </pre></div>

<p>Read in a file using 4096 frames, file playes twice.
 </p><div class="example">
<pre class="example-preformatted"> afr = dsp.AudioFileReader(&quot;Filename&quot;, &quot;sample.wav&quot;, &quot;SamplesPerFrame&quot;, 4096, &quot;PlayCount&quot;, 2)
 while ! isDone(afr)
   data = afr();
 endwhile
 </pre></div>
</dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-obj_0028_0029"><span><code class="def-type">[<var class="var">data</var>. <var class="var">iseof</var>] =</code> <strong class="def-name"><var class="var">obj</var>()</strong></span></dt>
<dd><p>Generate a frame of waveform data from the generator function,
 iseof will be true if the end of file was reached at any point during reading the frame.
</p>
<h4 class="subsubheading" id="Inputs-1"><span>Inputs</span></h4>
<p><var class="var">obj</var> - AudioFileReader object
</p>
<h4 class="subsubheading" id="Outputs-1"><span>Outputs</span></h4>
<p><var class="var">data</var> - waveform data
 </p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-release_0028obj_0029"><span><strong class="def-name">release(<var class="var">obj</var>)</strong></span></dt>
<dd><p>Release resources of generator
</p>
<h4 class="subsubheading" id="Inputs-2"><span>Inputs</span></h4>
<p><var class="var">obj</var> - AudioFileReader object
</p>
<h4 class="subsubheading" id="Outputs-2"><span>Outputs</span></h4>
<p>None
 </p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-isDone_0028obj_0029"><span><code class="def-type"><var class="var">tf</var> =</code> <strong class="def-name">isDone(<var class="var">obj</var>)</strong></span></dt>
<dd><p>Return status of iterating the data.
</p>
<h4 class="subsubheading" id="Inputs-3"><span>Inputs</span></h4>
<p><var class="var">obj</var> - AudioFileReader object
</p>
<h4 class="subsubheading" id="Outputs-3"><span>Outputs</span></h4>
<p><var class="var">tf</var> -  true if at end of file and data has been iterated playcount times
 </p></dd></dl>