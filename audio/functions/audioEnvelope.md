---
layout: "default"
permalink: "/functions/13_audioEnvelope/"
pkg_name: "audio"
pkg_version: "2.0.12"
pkg_description: "Audio and MIDI Toolbox for GNU Octave"
title: "Audio Toolkit - audioEnvelope"
category: "Audio File I/O"
func_name: "audioEnvelope"
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
<dt class="deftypefn def-line" id="index-audioEnvelope_0028audiodata_0029"><span><code class="def-type">[<var class="var">minenv</var> ,<var class="var">maxenv</var>, <var class="var">loc</var>, <var class="var">fs</var>] =</code> <strong class="def-name">audioEnvelope(audiodata)</strong></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioEnvelope_0028filename_0029"><span><code class="def-type">[<var class="var">minenv</var> ,<var class="var">maxenv</var>, <var class="var">loc</var>, <var class="var">fs</var>] =</code> <strong class="def-name">audioEnvelope(filename)</strong></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioEnvelope_0028_005f_005f_005f_002c"><span><code class="def-type">[<var class="var">minenv</var> ,<var class="var">maxenv</var>, <var class="var">loc</var>, <var class="var">fs</var>] =</code> <strong class="def-name">audioEnvelope(___,</strong> <code class="def-code-arguments"><var class="var">propname</var>, <var class="var">propvalue</var> &hellip;)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioEnvelope_0028_005f_005f_005f_0029"><span><strong class="def-name">audioEnvelope(___)</strong></span></dt>
<dd><p>calculate envelope information for a audio signal.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<p><var class="var">audiodata</var> - input data, as a matrix or column vector where each column is a channel.
</p>
<p><var class="var">filename</var> - input audio file to read.
</p>
<p><var class="var">propname</var>, <var class="var">propvalue</var> - property name/value pairs.
</p>
<p>Known properties are:
 </p><dl class="table">
<dt>NumPoints</dt>
<dd><p>Number of points that make up each envelop (default 1000)
 </p></dd>
<dt>SampleRate</dt>
<dd><p>Samplerate of the input data. When a filename is specified, sample
 rate is taken from the file.
 </p></dd>
<dt>Range</dt>
<dd><p>A 2 element vector for the start,end range of input signal to be used.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<p><var class="var">minenv</var> - minimum values of the envelope as a NumPoints-by-C matrix, where C is the number of channels in the input signal.
</p>
<p><var class="var">maxenv</var> - maximum values of the envelope as a NumPoints-by-C matrix, where C is the number of channels in the input signal.
</p>
<p><var class="var">loc</var> - Index into the audioodata for each frame.
</p>
<p><var class="var">fs</var> - Sample rate. If the input is audiodata, and no sample rate option was provided, fs will be 1.
</p>
</dd></dl>