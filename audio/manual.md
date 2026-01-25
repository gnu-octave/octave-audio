---
layout: "default"
permalink: "/manual/"
title: "Audio Toolkit - Manual"
pkg_name: "audio"
version: "2.0.10"
description: "Audio and MIDI Toolbox for GNU Octave"
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
- id: "Installing-and-loading-1"
  name: "&nbsp;&nbsp; Installing and loading"
  url: "/manual/#Installing-and-loading-1"
- id: "Basic-Usage-Overview-1"
  name: "&nbsp;&nbsp; Basic Usage Overview"
  url: "/manual/#Basic-Usage-Overview-1"
- id: "Function-Reference-1"
  name: "&nbsp;&nbsp; Function Reference"
  url: "/manual/#Function-Reference-1"
---
<div class="top-level-extent" id="Top">
<h1 class="top" id="Introduction">Introduction</h1>
<p>The Audio toolkit is a set of functions for manipulating MIDI devices and files for GNU Octave
</p>
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>
<div class="contents">
<ul class="toc-numbered-mark">
  <li><a id="toc-Installing-and-loading" href="#Installing-and-loading">1 Installing and loading</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-Windows-install" href="#Windows-install">1.1 Windows install</a></li>
    <li><a id="toc-Online-Direct-install" href="#Online-Direct-install">1.2 Online Direct install</a></li>
    <li><a id="toc-Off_002dline-install" href="#Off_002dline-install">1.3 Off-line install</a></li>
    <li><a id="toc-Loading" href="#Loading">1.4 Loading</a></li>
  </ul></li>
  <li><a id="toc-Basic-Usage-Overview" href="#Basic-Usage-Overview">2 Basic Usage Overview</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-Conversion-Functionality" href="#Conversion-Functionality">2.1 Conversion Functionality</a></li>
    <li><a id="toc-Waveform-Generation" href="#Waveform-Generation-1">2.2 Waveform Generation</a></li>
    <li><a id="toc-MIDI-Functionality" href="#MIDI-Functionality">2.3 MIDI Functionality</a></li>
  </ul></li>
  <li><a id="toc-Function-Reference" href="#Function-Reference">3 Function Reference</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-MIDI-Device-Interface" href="#MIDI-Device-Interface">3.1 MIDI Device Interface</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-_0040octave_005fmidi_002fhasdata" href="#g_t_0040octave_005fmidi_002fhasdata">3.1.1 @octave_midi/hasdata</a></li>
      <li><a id="toc-mididevice" href="#mididevice">3.1.2 mididevice</a></li>
      <li><a id="toc-mididevinfo" href="#mididevinfo">3.1.3 mididevinfo</a></li>
      <li><a id="toc-midiflush" href="#midiflush">3.1.4 midiflush</a></li>
      <li><a id="toc-midimsg" href="#midimsg">3.1.5 midimsg</a></li>
      <li><a id="toc-midireceive" href="#midireceive">3.1.6 midireceive</a></li>
      <li><a id="toc-midisend" href="#midisend">3.1.7 midisend</a></li>
    </ul></li>
    <li><a id="toc-MIDI-Controller-Interface" href="#MIDI-Controller-Interface">3.2 MIDI Controller Interface</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-midicallback" href="#midicallback">3.2.1 midicallback</a></li>
      <li><a id="toc-midicontrols" href="#midicontrols">3.2.2 midicontrols</a></li>
      <li><a id="toc-midiid" href="#midiid">3.2.3 midiid</a></li>
      <li><a id="toc-midiread" href="#midiread">3.2.4 midiread</a></li>
      <li><a id="toc-midisync" href="#midisync">3.2.5 midisync</a></li>
    </ul></li>
    <li><a id="toc-MIDI-File-I_002fO" href="#MIDI-File-I_002fO">3.3 MIDI File I/O</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-ismidifile" href="#ismidifile">3.3.1 ismidifile</a></li>
      <li><a id="toc-midifileinfo" href="#midifileinfo">3.3.2 midifileinfo</a></li>
      <li><a id="toc-midifileread" href="#midifileread">3.3.3 midifileread</a></li>
      <li><a id="toc-midifilewrite" href="#midifilewrite">3.3.4 midifilewrite</a></li>
    </ul></li>
    <li><a id="toc-Enumerations" href="#Enumerations">3.4 Enumerations</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-midimsgtype" href="#midimsgtype">3.4.1 midimsgtype</a></li>
    </ul></li>
    <li><a id="toc-Waveform-Generation-1" href="#Waveform-Generation">3.5 Waveform Generation</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-audioOscillator" href="#audioOscillator">3.5.1 audioOscillator</a></li>
    </ul></li>
    <li><a id="toc-Domain-Conversion" href="#Domain-Conversion">3.6 Domain Conversion</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-bark2hz" href="#bark2hz">3.6.1 bark2hz</a></li>
      <li><a id="toc-erb2hz" href="#erb2hz">3.6.2 erb2hz</a></li>
      <li><a id="toc-hz2bark" href="#hz2bark">3.6.3 hz2bark</a></li>
      <li><a id="toc-hz2erb" href="#hz2erb">3.6.4 hz2erb</a></li>
      <li><a id="toc-hz2mel" href="#hz2mel">3.6.5 hz2mel</a></li>
      <li><a id="toc-mel2hz" href="#mel2hz">3.6.6 mel2hz</a></li>
      <li><a id="toc-phon2sone" href="#phon2sone">3.6.7 phon2sone</a></li>
      <li><a id="toc-sone2phon" href="#sone2phon">3.6.8 sone2phon</a></li>
    </ul></li>
  </ul></li>
  <li><a id="toc-GNU-General-Public-License" href="#Copying">Appendix A GNU General Public License</a></li>
  <li><a id="toc-Index" href="#Index" rel="index">Index</a></li>
</ul>
</div>
</div>
<hr>
<div class="chapter-level-extent" id="Installing-and-loading">
<h2 class="chapter" id="Installing-and-loading-1">1 Installing and loading</h2>
<a class="index-entry-id" id="index-Installing-and-loading"></a>
<p>The Audio toolkit must be installed and then loaded to be used.
</p>
<p>It can be installed in <abbr class="acronym">GNU</abbr> Octave directly from octave-forge,
or can be installed in an off-line mode via a downloaded tarball.
</p>
<p>The toolkit has a dependency on the RTMIDI library (<a class="url" href="https://github.com/thestk/rtmidi">https://github.com/thestk/rtmidi</a>), so it must be installed in order
to successfully install the toolkit.
</p>
<p>For Fedora: <code class="code">yum install rtmidi-devel</code> 
</p>
<p>For Ubuntu: <code class="code">apt install librtmidi-dev</code> 
</p>
<p>The toolkit must be then be loaded once per each <abbr class="acronym">GNU</abbr> Octave session in order to use its functionality.
</p>
<div class="section-level-extent" id="Windows-install">
<h3 class="section">1.1 Windows install</h3>
<a class="index-entry-id" id="index-Windows-install"></a>
<p>If running in Windows, the package may already be installed, to check run:
</p>
<div class="example">
<pre class="example-preformatted">pkg list audio
</pre></div>
<p>Otherwise it can be installed by installing the requirements and then using the online or offline install method.
</p>
</div>
<div class="section-level-extent" id="Online-Direct-install">
<h3 class="section">1.2 Online Direct install</h3>
<a class="index-entry-id" id="index-Online-install"></a>
<p>With an internet connection available, the Audio package can be installed from
octave-forge using the following command within <abbr class="acronym">GNU</abbr> Octave:
</p>
<div class="example">
<pre class="example-preformatted">pkg install -forge audio
</pre></div>
<p>The latest released version of the toolkit will be downloaded and installed.
</p>
</div>
<div class="section-level-extent" id="Off_002dline-install">
<h3 class="section">1.3 Off-line install</h3>
<a class="index-entry-id" id="index-Off_002dline-install"></a>
<p>With the Audio toolkit package already downloaded, and in the current directory when running
<abbr class="acronym">GNU</abbr> Octave, the package can be installed using the following command within <abbr class="acronym">GNU</abbr> Octave:
</p>
<div class="example">
<pre class="example-preformatted">pkg install audio-2.0.10.tar.gz
</pre></div>
</div>
<div class="section-level-extent" id="Loading">
<h3 class="section">1.4 Loading</h3>
<a class="index-entry-id" id="index-Loading"></a>
<p>Regardless of the method of installing the Audio toolkit, in order to use its functions,
the toolkit must be loaded using the pkg load command:
</p>
<div class="example">
<pre class="example-preformatted">pkg load audio
</pre></div>
<p>The toolkit must be loaded on each <abbr class="acronym">GNU</abbr> Octave session.
</p>
<hr>
</div>
</div>
<div class="chapter-level-extent" id="Basic-Usage-Overview">
<h2 class="chapter" id="Basic-Usage-Overview-1">2 Basic Usage Overview</h2>
<a class="index-entry-id" id="index-Basic-Usage-Overview"></a>
<p>The Audio package must be loaded each time a <abbr class="acronym">GNU</abbr> Octave session is started:
</p><div class="example">
<pre class="example-preformatted">pkg load audio
</pre></div>
<p>An overview of the package can be displayed by running <code class="code">help audio</code>
</p>
<p>Help for each function can be displayed by  <code class="code">help thefunctionname</code>
</p>
<p>ie: 
</p><div class="example">
<pre class="example-preformatted">help mididevice
</pre></div>
<div class="section-level-extent" id="Conversion-Functionality">
<h3 class="section">2.1 Conversion Functionality</h3>
<a class="index-entry-id" id="index-Conversion-Functionality"></a>
<p>The following functions are available to convert between audio domains:
</p><dl class="table">
<dt>hz2erb, erb2hz</dt>
<dd><p>Conversion between hz and equivalent rectangular bandwidths (ERP) frequency scales
</p></dd>
<dt>hz2mel, mel2hz</dt>
<dd><p>Conversion between hz and equivalent mel frequency scales
</p></dd>
<dt>hz2bark, bark2hz</dt>
<dd><p>Conversion between hz and equivalent bark frequency scales
</p></dd>
<dt>phon2sone, sone2phone</dt>
<dd><p>Conversion between sone and phon loudness scales
</p></dd>
</dl>
</div>
<div class="section-level-extent" id="Waveform-Generation-1">
<h3 class="section">2.2 Waveform Generation</h3>
<a class="index-entry-id" id="index-Waveform-Generation"></a>
<p>The <code class="code">audioOscillator</code> function provides a method of creating a waveform generator for sine,
square and sawtooth waveforms.
</p>
<div class="example">
<pre class="example-preformatted">% create a sawtooth audio generator
osc = audioOscillator(&quot;sawtooth&quot;);
% get a frame of data
data = osc();
% plot the data
plot(data);
</pre></div>
</div>
<div class="section-level-extent" id="MIDI-Functionality">
<h3 class="section">2.3 MIDI Functionality</h3>
<a class="index-entry-id" id="index-MIDI-Functionality"></a>
<p>The Audio toolkit provides 3 main types of MIDI functionality:
</p>
<dl class="table">
<dt>Device functions</dt>
<dd><p>These are functions that directly allow opening, sending and receiving MIDI messages.
</p></dd>
<dt>Controller functions</dt>
<dd><p>Functions that provide a layer on top of the device functions for using MIDI controls.
</p></dd>
<dt>File functions</dt>
<dd><p>Basic functions that allow read and write of MIDI files.
</p></dd>
</dl>
<p>To read and write to a MIDI device, a MIDI device object must be created, using the name or id
of a known MIDI device as provided by the mididevinfo function.
</p>
<p>MIDI devices can then be read using the midisend and midireceive functions that use midimsg type to encapsulate the MIDI data.
</p>
<div class="example">
<pre class="example-preformatted">% list the midi devices
devs = mididevinfo
% open a midi device, specifying the first input and output MIDI device
dev = mididevice(&quot;input&quot;, devs.input{1}.ID, &quot;output&quot;, devs.output{1}.ID)
% receive data and echo it through the output port
while true
  msg = midireceive(dev, 1);
  if !isempty(msg)
    midisend(msg);
  endif
endwhile
</pre></div>
<hr>
</div>
</div>
<div class="chapter-level-extent" id="Function-Reference">
<h2 class="chapter" id="Function-Reference-1">3 Function Reference</h2>
<a class="index-entry-id" id="index-Function-Reference"></a>
<p>The functions currently available in the Audio toolkit are described below:
</p>
<hr>
<div class="section-level-extent" id="MIDI-Device-Interface">
<h3 class="section" id="MIDI-Device-Interface-1">3.1 MIDI Device Interface</h3>
<a class="index-entry-id" id="index-MIDI-Device-Interface"></a>
<div class="subsection-level-extent" id="g_t_0040octave_005fmidi_002fhasdata">
<h4 class="subsection">3.1.1 @octave_midi/hasdata</h4>
<a class="index-entry-id" id="index-hasdata"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hasdata-1"><span><code class="def-type"><var class="var">tf</var> =</code> <strong class="def-name">hasdata</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code></span></dt>
<dd><p>Return whether there is data available to read
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<p><var class="var">dev</var> - a octave midi device opened using mididevice.<br>
</p>
<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p><var class="var">tf</var> - true if device has data available to read<br>
</p>
<p><strong class="strong">See also:</strong> mididevice.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="mididevice">
<h4 class="subsection">3.1.2 mididevice</h4>
<a class="index-entry-id" id="index-mididevice"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-mididevice-1"><span><code class="def-type"><var class="var">dev</var> =</code> <strong class="def-name">mididevice</strong> <code class="def-code-arguments">(<var class="var">mididev</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mididevice-2"><span><code class="def-type"><var class="var">dev</var> =</code> <strong class="def-name">mididevice</strong> <code class="def-code-arguments">(<var class="var">mididir</var>, <var class="var">mididev</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mididevice-3"><span><code class="def-type"><var class="var">dev</var> =</code> <strong class="def-name">mididevice</strong> <code class="def-code-arguments">(&quot;input&quot;, <var class="var">midiindev</var>, &quot;output&quot;, <var class="var">midioutdev</var>)</code></span></dt>
<dd><p>Create a midi device using the input parameters.
</p>
<p>When a single device name or id is provided, attempt to create the midi device using the same name for both input and output.
</p>
<p>Otherwise, use the name or device id for the given input or output direction.
</p>
<h4 class="subsubheading" id="Inputs-1">Inputs</h4>
<p><var class="var">mididev</var> - name or id of device to load.<br>
<var class="var">mididir</var> - midi direction of &quot;input&quot; or &quot;output&quot;<br>
<var class="var">midiindev</var> - midi input name or id<br>
<var class="var">midioutdev</var> - midi output name or id
</p>
<h4 class="subsubheading" id="Outputs-1">Outputs</h4>
<p><var class="var">dev</var> - octave_midi class for opened device
</p>
<h4 class="subsubheading" id="Properties">Properties</h4>
<p><var class="var">Input</var> - Input device name (read only).<br>
<var class="var">Output</var> - Output device name (read only).<br>
<var class="var">InputID</var> - Input device id (read only).<br>
<var class="var">OutputID</var> - Output device id (read only).<br>
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Open midi device with ID of 0.
</p><div class="example">
<pre class="example-preformatted"><code class="command">&gt;</code> dev = mididevice(0);
  mididevice connected to
    input: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (1)
    output: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (0)
</pre></div>
<p>Open a named midi device:
</p><div class="example">
<pre class="example-preformatted"><code class="command">&gt;</code> dev = mididevice(&quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot;);
  mididevice connected to
    input: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (1)
    output: &quot;SparkFun Pro Micro:SparkFun Pro Micro MIDI 1 20:0&quot; (0)
</pre></div>
<p><strong class="strong">See also:</strong> mididevinfo.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="mididevinfo">
<h4 class="subsection">3.1.3 mididevinfo</h4>
<a class="index-entry-id" id="index-mididevinfo"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-mididevinfo-1"><span><code class="def-type"><var class="var">devlist</var> =</code> <strong class="def-name">mididevinfo</strong> <code class="def-code-arguments">()</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-mididevinfo-2"><span><strong class="def-name">mididevinfo</strong> <code class="def-code-arguments">()</code></span></dt>
<dd><p>Retrieve the midi devices detected within the system.
</p>
<p>The list will be stored with variable <var class="var">devlist</var> as either a input or output device.
 If no output variable is provided, the devices will be displayed.
</p>
<h4 class="subsubheading" id="Inputs-2">Inputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Outputs-2">Outputs</h4>
<p><var class="var">devlist</var> - a structure containing the midi device information
</p>
<h4 class="subsubheading" id="Examples-1">Examples</h4>
<p>Display the known devices of the system.
</p><div class="example">
<pre class="example-preformatted"><code class="command">&gt;</code> mididevinfo
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
<pre class="example-preformatted"><code class="command">&gt;</code> mididevices = mididevinfo
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
</div>
<div class="subsection-level-extent" id="midiflush">
<h4 class="subsection">3.1.4 midiflush</h4>
<a class="index-entry-id" id="index-midiflush"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midiflush-1"><span><strong class="def-name">midiflush</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code></span></dt>
<dd><p>Flush the receive buffers on a midi device
</p>
<h4 class="subsubheading" id="Inputs-3">Inputs</h4>
<p><var class="var">dev</var> - midi device opened using mididevice<br>
</p>
<h4 class="subsubheading" id="Outputs-3">Outputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples-2">Examples</h4>
<p>Flush a midi device
</p><div class="example">
<pre class="example-preformatted"> midiflush(dev);
</pre></div>
<p><strong class="strong">See also:</strong> mididevice, midireceive.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midimsg">
<h4 class="subsection">3.1.5 midimsg</h4>
<a class="index-entry-id" id="index-midimsg"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midimsg-1"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(0)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-2"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">()</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-3"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(<var class="var">type</var> ....)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-4"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;note&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">velocity</var>, <var class="var">duration</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-5"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;noteon&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">velocity</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-6"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;noteoff&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">velocity</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-7"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;programchange&quot;, <var class="var">channel</var>, <var class="var">prog</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-8"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;controlchange&quot;, <var class="var">channel</var>, <var class="var">ccnum</var>, <var class="var">ccval</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-9"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;polykeypressure&quot;, <var class="var">channel</var>, <var class="var">note</var>, <var class="var">keypressure</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-10"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;channelpressure&quot;, <var class="var">channel</var>, <var class="var">chanpressure</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-11"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;localcontrol&quot;, <var class="var">channel</var>, <var class="var">localcontrol</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-12"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;pitchbend&quot;, <var class="var">channel</var>, <var class="var">pitchchange</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-13"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;polyon&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-14"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;monoon&quot;, <var class="var">channel</var>, <var class="var">monochannels</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-15"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;omnion&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-16"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;omnioff&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-17"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;allsoundoff&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-18"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;allnotesoff&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-19"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;resetallcontrollers&quot;, <var class="var">channel</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-20"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;start&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-21"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;stop&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-22"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;continue&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-23"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;systemreset&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-24"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;activesensing&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-25"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;timingclock&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-26"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;systemexclusive&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-27"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;systemexclusive&quot;, <var class="var">bytes</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-28"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;eox&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-29"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;data&quot;, <var class="var">bytes</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-30"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;songselect&quot;, <var class="var">song</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-31"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;songpositionpointer&quot;, <var class="var">songposition</var>, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-32"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;tunerequest&quot;, <var class="var">timestamp</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midimsg-33"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midimsg</strong> <code class="def-code-arguments">(&quot;miditimecodequarterframe&quot;, <var class="var">timeseq</var>, <var class="var">timevalue</var>, <var class="var">timestamp</var>)</code></span></dt>
<dd><p>Create a midimsg object
</p>
<p>If the input parameter is 0, create an empty midi message object
 Otherwise the first variable is the type of message to create, followed by the additional
 parameters for the message.
</p>
<p>For each message type, the timestamp value is optional.
</p>
<h4 class="subsubheading" id="Inputs-4">Inputs</h4>
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
<h4 class="subsubheading" id="Outputs-4">Outputs</h4>
<p><var class="var">msg</var> - a midimsg object containing the midi data of the message
</p>
<h4 class="subsubheading" id="Properties-1">Properties</h4>
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
<h4 class="subsubheading" id="Examples-3">Examples</h4>
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
</div>
<div class="subsection-level-extent" id="midireceive">
<h4 class="subsection">3.1.6 midireceive</h4>
<a class="index-entry-id" id="index-midireceive"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midireceive-1"><span><code class="def-type"><var class="var">midimsg</var> =</code> <strong class="def-name">midireceive</strong> <code class="def-code-arguments">(<var class="var">dev</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midireceive-2"><span><code class="def-type"><var class="var">midimsg</var> =</code> <strong class="def-name">midireceive</strong> <code class="def-code-arguments">(<var class="var">dev</var>, <var class="var">maxmsg</var>)</code></span></dt>
<dd><p>Attempt to receive midi messages from a midi device.
</p>
<h4 class="subsubheading" id="Inputs-5">Inputs</h4>
<p><var class="var">dev</var> - a octave midi device opened using mididevice.<br>
<var class="var">maxmsg</var> - Maximum number of messages to retrieve. If not specified, the function will attempt to get all pending.<br>
</p>
<h4 class="subsubheading" id="Outputs-5">Outputs</h4>
<p><var class="var">midimsg</var> - a midimsg containing the messages retrieved from the device.<br>
 If no messages are available, <var class="var">midimsg</var> will be empty.
</p>
<h4 class="subsubheading" id="Examples-4">Examples</h4>
<p>Open device 0, and poll and display read messages
</p><div class="example">
<pre class="example-preformatted"> dev = mididevice(0);
 while true
    mx = midireceive(dev);
    if !isempty(mx)
      % display message
      mx
    endif
 endwhile
</pre></div>
<p><strong class="strong">See also:</strong> mididevice, midisend.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midisend">
<h4 class="subsection">3.1.7 midisend</h4>
<a class="index-entry-id" id="index-midisend"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midisend-1"><span><strong class="def-name">midisend</strong> <code class="def-code-arguments">(<var class="var">dev</var>, <var class="var">msg</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midisend-2"><span><strong class="def-name">midisend</strong> <code class="def-code-arguments">(<var class="var">dev</var>, ...)</code></span></dt>
<dd><p>Send a midimsg to a midi device
</p>
<h4 class="subsubheading" id="Inputs-6">Inputs</h4>
<p><var class="var">dev</var> - midi device opened using mididevice<br>
<var class="var">msg</var> - a midi message class with messages to send to the midi device<br>
 If the msg isn&rsquo;t a midimsg class, the input data is expected to be in same format as the inputs to a midimsg object.
</p>
<h4 class="subsubheading" id="Outputs-6">Outputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples-5">Examples</h4>
<p>Send a note on/off command to a opened midi device <var class="var">dev</var>
</p><div class="example">
<pre class="example-preformatted"> midisend(dev, midimsg(&quot;note&quot;, 1, 60, 100, 2.0));
</pre></div>
<p><strong class="strong">See also:</strong> midimsg, mididevice, midireceive.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="MIDI-Controller-Interface">
<h3 class="section" id="MIDI-Controller-Interface-1">3.2 MIDI Controller Interface</h3>
<a class="index-entry-id" id="index-MIDI-Controller-Interface"></a>
<div class="subsection-level-extent" id="midicallback">
<h4 class="subsection">3.2.1 midicallback</h4>
<a class="index-entry-id" id="index-midicallback"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midicallback-1"><span><code class="def-type"><var class="var">oldhandle</var> =</code> <strong class="def-name">midicallback</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>, <var class="var">functionHandle</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midicallback-2"><span><code class="def-type"><var class="var">oldhandle</var> =</code> <strong class="def-name">midicallback</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>, [])</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midicallback-3"><span><code class="def-type"><var class="var">currhandle</var> =</code> <strong class="def-name">midicallback</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>)</code></span></dt>
<dd><p>Get, set or clear the midicontrol object callback.
</p>
<h4 class="subsubheading" id="Inputs-7">Inputs</h4>
<p><var class="var">midicontrolObj</var> - control object created using midicontrols.
</p>
<p><var class="var">functionHandle</var> - function handle to set for call back. If it is [],
 the callback function will be cleared.
</p>
<p><strong class="strong">NOTE</strong>: currently anonymous functions will not work.
</p>
<p><strong class="strong">NOTE</strong>: callbacks should be cleared before losing all references to the midicontrols
 object.
</p>
<h4 class="subsubheading" id="Outputs-7">Outputs</h4>
<p><var class="var">oldhandle</var> The previously set midicallback function handle when setting a new callback.
</p>
<p><var class="var">currhandle</var> The current set midicallback function handle.
</p>
<h4 class="subsubheading" id="Examples-6">Examples</h4>
<p>Set a callback on a midicontrols object
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 function dispCallback(ctrl),disp(midiread(ctrl)),endfunction;
 midicallback(ctrl, @dispCallback);
</pre></div>
<p>Clear the callback on a midicontrols object
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 midicallback(ctrl, []);
</pre></div>
<p>Get the current callback on a midicontrols object
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 cb = midicallback(ctrl);
</pre></div>
<p><strong class="strong">See also:</strong> midicontrols, midisync, midiread.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midicontrols">
<h4 class="subsection">3.2.2 midicontrols</h4>
<a class="index-entry-id" id="index-midicontrols"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midicontrols-1"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">()</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midicontrols-2"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">(<var class="var">ctrlid</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midicontrols-3"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">(<var class="var">ctrlid</var>, <var class="var">initialvalues</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midicontrols-4"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">midicontrols</strong> <code class="def-code-arguments">(__, <var class="var">propertyname</var>, <var class="var">propertyvalue</var>)</code></span></dt>
<dd><p>Create a midi controls object
</p>
<h4 class="subsubheading" id="Inputs-8">Inputs</h4>
<p><var class="var">ctrlid</var> - single control id or array of control ids to monitor, or [] to use any controller.<br>
<var class="var">initialvalues</var> - initial values to use for controls. It should be the same size as <var class="var">ctrlid</var><br>
<var class="var">propertyname</var>, <var class="var">propertyvalue</var> - properties to set on the controller. If a device is not specified
 the value from getpref(&quot;midi&quot;, &quot;DefaultDevice&quot;, 0) will be used.<br>
</p>
<p>Known properties are:
</p><dl class="table">
<dt>mididevice</dt>
<dd><p>name of the mididevice to monitor.
</p></dd>
<dt>outputmode</dt>
<dd><p>the scaling mode for values: &rsquo;rawmidi&rsquo; will return values between 0 .. 127,
 &rsquo;normalized&rsquo; will use values between 0 .. 1.
</p></dd>
</dl>
<h4 class="subsubheading" id="Outputs-8">Outputs</h4>
<p><var class="var">obj</var> - returns a midicontrols object
</p>
<h4 class="subsubheading" id="Examples-7">Examples</h4>
<p>Create a midicontrols object monitoring control id 2001 on the default midi device
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
</pre></div>
<p>Create a midicontrols object monitoring control id 2001 on a a non default device
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001, 'mididevice', 1)
</pre></div>
<p><strong class="strong">See also:</strong> midiread, midisync.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midiid">
<h4 class="subsection">3.2.3 midiid</h4>
<a class="index-entry-id" id="index-midiid"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midiid-1"><span><code class="def-type">[<var class="var">ctrlid</var>, <var class="var">devname</var>] =</code> <strong class="def-name">midiid</strong> <code class="def-code-arguments">()</code></span></dt>
<dd><p>Scan for control messages from midi devices to get the id of the device
</p>
<p>Function will display a prompt for the user to move the midi control and return when
 a control messages is detected or ctrl-C is pressed.
</p>
<h4 class="subsubheading" id="Inputs-9">Inputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Outputs-9">Outputs</h4>
<p><var class="var">ctrlid</var> - control id made from the controller channel * 1000 + controller number.<br>
<var class="var">devname</var> = name of the midi device the controller was detected on.
</p>
<h4 class="subsubheading" id="Examples-8">Examples</h4>
<p>Monitor midi devices for first moving controller
</p><div class="example">
<pre class="example-preformatted"> [ctrlid, devname] = midiid()
</pre></div>
<p><strong class="strong">See also:</strong> mididevinfo, midicontrols.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midiread">
<h4 class="subsection">3.2.4 midiread</h4>
<a class="index-entry-id" id="index-midiread"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midiread-1"><span><code class="def-type"><var class="var">val</var> =</code> <strong class="def-name">midiread</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>)</code></span></dt>
<dd><p>Read current values of midi controls
</p>
<h4 class="subsubheading" id="Inputs-10">Inputs</h4>
<p><var class="var">midicontrolObj</var> - control object created using midicontrols<br>
</p>
<h4 class="subsubheading" id="Outputs-10">Outputs</h4>
<p><var class="var">val</var> single value or array of current values from the midi device.
</p>
<h4 class="subsubheading" id="Examples-9">Examples</h4>
<p>Read current value of midicontrols with a ctrlid 2001 on the default midi device.
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 val = midiread(ctrl);
</pre></div>
<p>Read current value of midicontrols with a ctrlid 2001 on a non default midi device.
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001, 'mididevice', 1)
 val = midiread(ctrl);
</pre></div>
<p><strong class="strong">See also:</strong> midicontrols, midisync.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midisync">
<h4 class="subsection">3.2.5 midisync</h4>
<a class="index-entry-id" id="index-midisync"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midisync-1"><span><strong class="def-name">midisync</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midisync-2"><span><strong class="def-name">midisync</strong> <code class="def-code-arguments">(<var class="var">midicontrolsObj</var>, <var class="var">ctrlvalues</var>)</code></span></dt>
<dd><p>Send the values of control object to the control, using <var class="var">ctrlvalues</var> values
 if specified instead
</p>
<h4 class="subsubheading" id="Inputs-11">Inputs</h4>
<p><var class="var">midicontrolObj</var> - control object created using midicontrols<br>
<var class="var">ctrlvalues</var> - values to send to the controls instead of initial values
</p>
<h4 class="subsubheading" id="Outputs-11">Outputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples-10">Examples</h4>
<p>Send sync command to a midicontrols with a ctrlid 2001 to set a value of 1
</p><div class="example">
<pre class="example-preformatted"> ctrl = midicontrols(2001)
 midisync(ctrl, 1);
</pre></div>
<p><strong class="strong">See also:</strong> midicontrols.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="MIDI-File-I_002fO">
<h3 class="section" id="MIDI-File-I_002fO-1">3.3 MIDI File I/O</h3>
<a class="index-entry-id" id="index-MIDI-File-I_002fO"></a>
<div class="subsection-level-extent" id="ismidifile">
<h4 class="subsection">3.3.1 ismidifile</h4>
<a class="index-entry-id" id="index-ismidifile"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-ismidifile-1"><span><code class="def-type"><var class="var">ismidi</var> =</code> <strong class="def-name">ismidifile</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code></span></dt>
<dd><p>Check if <var class="var">filename</var> is a midi file.
</p>
<p>The function only checks whether it is an existing file and the
 file starts with a valid &rsquo;MThd&rsquo; header.
</p>
<p>Non existing files, or files that do not meet the header criteria will return false.
</p>
<h4 class="subsubheading" id="Inputs-12">Inputs</h4>
<p><var class="var">filename</var> - filename of file to check.<br>
</p>
<h4 class="subsubheading" id="Outputs-12">Outputs</h4>
<p><var class="var">ismidi</var> - true if it is a midi file, false otherwise
</p>
<p><strong class="strong">See also:</strong> midifileread, midifilewrite.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midifileinfo">
<h4 class="subsection">3.3.2 midifileinfo</h4>
<a class="index-entry-id" id="index-midifileinfo"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midifileinfo-1"><span><code class="def-type"><var class="var">info</var> =</code> <strong class="def-name">midifileinfo</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code></span></dt>
<dd><p>Read MIDI file and display information about the tracks and data
</p>
<h4 class="subsubheading" id="Inputs-13">Inputs</h4>
<p><var class="var">filename</var> - filename of file to open.<br>
</p>
<h4 class="subsubheading" id="Outputs-13">Outputs</h4>
<p><var class="var">info</var> - structure of the midi file data
 with the following fields:<br>
</p><dl class="table">
<dt>filename</dt>
<dd><p>the name of the file
</p></dd>
<dt>header</dt>
<dd><p>The header block information
</p></dd>
<dt>track</dt>
<dd><p>An array of tracks read from the file
</p></dd>
<dt>other</dt>
<dd><p>An array of non-track midi blocks read from the file
</p></dd>
</dl>
<p><strong class="strong">See also:</strong> midifileread.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midifileread">
<h4 class="subsection">3.3.3 midifileread</h4>
<a class="index-entry-id" id="index-midifileread"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midifileread-1"><span><code class="def-type"><var class="var">msg</var> =</code> <strong class="def-name">midifileread</strong> <code class="def-code-arguments">(<var class="var">filename</var>, [propertyname, propertyvalue &hellip;])</code></span></dt>
<dd><p>Read MIDI file into a midimsg
</p>
<h4 class="subsubheading" id="Inputs-14">Inputs</h4>
<p><var class="var">filename</var> - filename of file to open.<br>
<var class="var">propertyname</var>, <var class="var">properyvalue</var> - optional propertyname/value pairs.<br>
</p>
<p>Known property values are:
</p><dl class="table">
<dt>includemetaevents</dt>
<dd><p>A True/False value to include MetaEvents in the out message list.
</p></dd>
</dl>
<h4 class="subsubheading" id="Outputs-14">Outputs</h4>
<p><var class="var">msg</var> - a midimsg struct containing the messages read from the file<br>
</p>
<p><strong class="strong">See also:</strong> midifileinfo, midimsg.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="midifilewrite">
<h4 class="subsection">3.3.4 midifilewrite</h4>
<a class="index-entry-id" id="index-midifilewrite"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midifilewrite-1"><span><strong class="def-name">midifilewrite</strong> <code class="def-code-arguments">(<var class="var">filename</var>, <var class="var">msgs</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-midifilewrite-2"><span><strong class="def-name">midifilewrite</strong> <code class="def-code-arguments">(<var class="var">filename</var>, <var class="var">msgs</var>, <var class="var">optionname</var>, <var class="var">optionvalue</var>)</code></span></dt>
<dd><p>Write a midifile
</p>
<h4 class="subsubheading" id="Inputs-15">Inputs</h4>
<p><var class="var">filename</var> - filename of file to open.<br>
<var class="var">msg</var> - a midimsg struct or a cell array of midimsg containing data to write to file<br>
<var class="var">optionname</var>, <var class="var">optionvalue</var> - option value/name pairs<br>
</p>
<p>Known options are:
</p><dl class="table">
<dt>format</dt>
<dd><p>MIDI file format number. (0 (default), 1, 2)
</p></dd>
</dl>
<p>Where format is 0, if a cell array is passed to midifilewrite, the midimsg values will
 be concatenated together before saving.
</p>
<p>Were format is not 0, the cell array is treated as tracks of misimsg.
</p>
<h4 class="subsubheading" id="Outputs-15">Outputs</h4>
<p>None
</p>
<p><strong class="strong">See also:</strong> midifileread, midimsg.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Enumerations">
<h3 class="section" id="Enumerations-1">3.4 Enumerations</h3>
<a class="index-entry-id" id="index-Enumerations"></a>
<div class="subsection-level-extent" id="midimsgtype">
<h4 class="subsection">3.4.1 midimsgtype</h4>
<a class="index-entry-id" id="index-midimsgtype"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-midimsgtype-1"><span><strong class="def-name">midimsgtype</strong></span></dt>
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
<h4 class="subsubheading" id="Examples-11">Examples</h4>
<p>Use both a string and a midimsgtype for the type parameter of a midimsg.
</p><div class="example">
<pre class="example-preformatted"><code class="code">
 # both statements are equivalent
 msg = midimsg('NoteOn', 1, 60, 100);
 msg = midimsg(midimsgtype.NoteOn, 1, 60, 100);
 </code>
</pre></div>
<p><strong class="strong">See also:</strong> midimsg.
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Waveform-Generation">
<h3 class="section" id="Waveform-Generation-2">3.5 Waveform Generation</h3>
<a class="index-entry-id" id="index-Waveform-Generation-1"></a>
<div class="subsection-level-extent" id="audioOscillator">
<h4 class="subsection">3.5.1 audioOscillator</h4>
<a class="index-entry-id" id="index-audioOscillator"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-audioOscillator-1"><span><strong class="def-name">audioOscillator</strong></span></dt>
<dd><p>Generate sine, sawtool and square waveforms
</p></dd></dl>
<h4 class="subheading" id="Methods">Methods</h4>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-audioOscillator-2"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">()</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioOscillator-3"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(<var class="var">signalTypeValue</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioOscillator-4"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(<var class="var">signalTypeValue</var>, <var class="var">frequencyValue</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-audioOscillator-5"><span><code class="def-type"><var class="var">obj</var> =</code> <strong class="def-name">audioOscillator</strong> <code class="def-code-arguments">(__, <var class="var">propertyname</var>, <var class="var">propertyvalue</var>)</code></span></dt>
<dd><p>Create a audioOscillator object
</p>
<h4 class="subsubheading" id="Inputs-16">Inputs</h4>
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
<h4 class="subsubheading" id="Outputs-16">Outputs</h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Examples-12">Examples</h4>
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
<h4 class="subsubheading" id="Inputs-17">Inputs</h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Outputs-17">Outputs</h4>
<p><var class="var">data</var> - waveform data
</p></dd></dl>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-release_0028obj_0029"><span><strong class="def-name">release(<var class="var">obj</var>)</strong></span></dt>
<dd><p>Release resources of generator
</p>
<h4 class="subsubheading" id="Inputs-18">Inputs</h4>
<p><var class="var">obj</var> - signalGenerator object
</p>
<h4 class="subsubheading" id="Outputs-18">Outputs</h4>
<p>None
</p></dd></dl>
<hr>
</div>
</div>
<div class="section-level-extent" id="Domain-Conversion">
<h3 class="section" id="Domain-Conversion-1">3.6 Domain Conversion</h3>
<a class="index-entry-id" id="index-Domain-Conversion"></a>
<div class="subsection-level-extent" id="bark2hz">
<h4 class="subsection">3.6.1 bark2hz</h4>
<a class="index-entry-id" id="index-bark2hz"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-bark2hz-1"><span><code class="def-type"><var class="var">hz</var> =</code> <strong class="def-name">bark2hz</strong> <code class="def-code-arguments">(<var class="var">bark</var>)</code></span></dt>
<dd><p>Convert equivalent Bark Frequency to Hz.
</p>
<h4 class="subsubheading" id="Inputs-19">Inputs</h4>
<p><var class="var">bark</var> - input frequency in bark.
</p>
<h4 class="subsubheading" id="Outputs-19">Outputs</h4>
<p><var class="var">hz</var> - Output frequency in Hz.
</p>
<h4 class="subsubheading" id="References">References</h4>
<p>Traunmüller, Hartmut. <cite class="cite">Analytical Expressions for the Tonotopic Sensory Scale.
 Journal of the Acoustical Society of America. Vol. 88, Issue 1, 1990</cite>
</p>
<p><strong class="strong">See also:</strong> hz2bark.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="erb2hz">
<h4 class="subsection">3.6.2 erb2hz</h4>
<a class="index-entry-id" id="index-erb2hz"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-erb2hz-1"><span><code class="def-type"><var class="var">hz</var> =</code> <strong class="def-name">erb2hz</strong> <code class="def-code-arguments">(<var class="var">erb</var>)</code></span></dt>
<dd><p>Convert equivalent rectangular bandwidth (ERB) to Hz.
</p>
<h4 class="subsubheading" id="Inputs-20">Inputs</h4>
<p><var class="var">erb</var> - input frequency in erb.
</p>
<h4 class="subsubheading" id="Outputs-20">Outputs</h4>
<p><var class="var">hz</var> - Output frequency in Hz.
</p>
<h4 class="subsubheading" id="References-1">References</h4>
<p>Glasberg and Moore. <cite class="cite">Derivation of Auditory Filter Shapes from Notched-Noise Data.
 Hearing Research. Vol. 47, 1990</cite>
</p>
<p><strong class="strong">See also:</strong> hz2erb.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="hz2bark">
<h4 class="subsection">3.6.3 hz2bark</h4>
<a class="index-entry-id" id="index-hz2bark"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hz2bark-1"><span><code class="def-type"><var class="var">bark</var> =</code> <strong class="def-name">hz2bark</strong> <code class="def-code-arguments">(<var class="var">hz</var>)</code></span></dt>
<dd><p>Convert hz to equivalent bark frequency
</p>
<h4 class="subsubheading" id="Inputs-21">Inputs</h4>
<p><var class="var">hz</var> - input frequency in Hz.
</p>
<h4 class="subsubheading" id="Outputs-21">Outputs</h4>
<p><var class="var">bark</var> - Output frequency as a bark value
</p>
<h4 class="subsubheading" id="Examples-13">Examples</h4>
<p>Convert 4000 Hz to erb
</p><div class="example">
<pre class="example-preformatted"><code class="code">erb = hz2erb(4000)</code>
</pre></div>
<h4 class="subsubheading" id="References-2">References</h4>
<p>Traunmüller, Hartmut. <cite class="cite">Analytical Expressions for the Tonotopic Sensory Scale.
 Journal of the Acoustical Society of America. Vol. 88, Issue 1, 1990</cite>
</p>
<p><strong class="strong">See also:</strong> bark2hz.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="hz2erb">
<h4 class="subsection">3.6.4 hz2erb</h4>
<a class="index-entry-id" id="index-hz2erb"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hz2erb-1"><span><code class="def-type"><var class="var">erb</var> =</code> <strong class="def-name">hz2erb</strong> <code class="def-code-arguments">(<var class="var">hz</var>)</code></span></dt>
<dd><p>Convert hz to equivalent rectangular bandwidth (ERB)
</p>
<h4 class="subsubheading" id="Inputs-22">Inputs</h4>
<p><var class="var">hz</var> - input frequency in Hz.
</p>
<h4 class="subsubheading" id="Outputs-22">Outputs</h4>
<p><var class="var">erb</var> - Output frequency as a erb value
</p>
<h4 class="subsubheading" id="Examples-14">Examples</h4>
<p>Convert 4000 Hz to erb
</p><div class="example">
<pre class="example-preformatted"><code class="code">erb = hz2erb(4000)</code>
</pre></div>
<p>Convert a range of Hz to erb
</p><div class="example">
<pre class="example-preformatted"><code class="code">erb = hz2erb(4000:100:5000)</code>
</pre></div>
<h4 class="subsubheading" id="References-3">References</h4>
<p>Glasberg and Moore. <cite class="cite">Derivation of Auditory Filter Shapes from Notched-Noise Data.
 Hearing Research. Vol. 47, 1990</cite>
</p>
<p><strong class="strong">See also:</strong> erb2hz.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="hz2mel">
<h4 class="subsection">3.6.5 hz2mel</h4>
<a class="index-entry-id" id="index-hz2mel"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-hz2mel-1"><span><code class="def-type"><var class="var">mel</var> =</code> <strong class="def-name">hz2mel</strong> <code class="def-code-arguments">(<var class="var">hz</var>)</code></span></dt>
<dd><p>Convert hz to equivalent mel frequency.
</p>
<h4 class="subsubheading" id="Inputs-23">Inputs</h4>
<p><var class="var">hz</var> - input frequency in Hz.
</p>
<h4 class="subsubheading" id="Outputs-23">Outputs</h4>
<p><var class="var">mel</var> - Output frequency as a mel value
</p>
<h4 class="subsubheading" id="Examples-15">Examples</h4>
<p>Convert 4000 Hz to mel
</p><div class="example">
<pre class="example-preformatted"><code class="code">mel = hz2mel(4000)</code>
</pre></div>
<p>Convert a range of Hz to mel
</p><div class="example">
<pre class="example-preformatted"><code class="code">mel = hz2erb(4000:100:5000)</code>
</pre></div>
<h4 class="subsubheading" id="References-4">References</h4>
<p>O&rsquo;Shaghnessy, Douglas. <cite class="cite">Speech Communication: Human and Machine. Reading, MA:
 Addison-Wesley Publishing Company, 1987</cite>
</p>
<p><strong class="strong">See also:</strong> mel2hz.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="mel2hz">
<h4 class="subsection">3.6.6 mel2hz</h4>
<a class="index-entry-id" id="index-mel2hz"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-mel2hz-1"><span><code class="def-type"><var class="var">hz</var> =</code> <strong class="def-name">mel2hz</strong> <code class="def-code-arguments">(<var class="var">mel</var>)</code></span></dt>
<dd><p>Convert equivalent mel frequency to Hz.
</p>
<h4 class="subsubheading" id="Inputs-24">Inputs</h4>
<p><var class="var">mel</var> - input frequency in mel.
</p>
<h4 class="subsubheading" id="Outputs-24">Outputs</h4>
<p><var class="var">hz</var> - Output frequency in Hz.
</p>
<h4 class="subsubheading" id="References-5">References</h4>
<p>O&rsquo;Shaghnessy, Douglas. <cite class="cite">Speech Communication: Human and Machine. Reading, MA:
 Addison-Wesley Publishing Company, 1987</cite>
</p>
<p><strong class="strong">See also:</strong> hz2mel.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="phon2sone">
<h4 class="subsection">3.6.7 phon2sone</h4>
<a class="index-entry-id" id="index-phon2sone"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-phon2sone-1"><span><code class="def-type"><var class="var">sone</var> =</code> <strong class="def-name">phon2sone</strong> <code class="def-code-arguments">(<var class="var">phon</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-phon2sone-2"><span><code class="def-type"><var class="var">sone</var> =</code> <strong class="def-name">phon2sone</strong> <code class="def-code-arguments">(<var class="var">phon</var>, <var class="var">standard</var>)</code></span></dt>
<dd><p>Convert from phon to sone
</p>
<h4 class="subsubheading" id="Inputs-25">Inputs</h4>
<p><var class="var">phon</var> - Loudness level in phon
</p>
<p><var class="var">standard</var> - Standard to use in conversion. Options are
 &rsquo;ISO 532-1&rsquo; or &rsquo;ISO 532-2&rsquo;.
</p>
<p>&rsquo;ISO 532-1&rsquo; is used if no standard is provided.
</p>
<h4 class="subsubheading" id="Outputs-25">Outputs</h4>
<p><var class="var">sone</var> - Loudness level in sone
</p>
<h4 class="subsubheading" id="Examples-16">Examples</h4>
<p>Convert 100 phon to sone
</p><div class="example">
<pre class="example-preformatted"><code class="code">sone = phon2sone(100)</code>
</pre></div>
<h4 class="subsubheading" id="References-6">References</h4>
<p>International Organization for Standardization., <cite class="cite">ISO 532-1 Acoustics – Methods for calculating loudness – Part 1: Zwicker method.</cite>
</p>
<p>International Organization for Standardization., <cite class="cite">ISO 532-2 Acoustics – Methods for calculating loudness – Part 2: Moore-Glasberg method.</cite>
</p>
<p>https://sengpielaudio.com/calculatorSonephon.htm
</p>
<p><strong class="strong">See also:</strong> sone2phon.
</p></dd></dl>
</div>
<div class="subsection-level-extent" id="sone2phon">
<h4 class="subsection">3.6.8 sone2phon</h4>
<a class="index-entry-id" id="index-sone2phon"></a>
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sone2phon-1"><span><code class="def-type"><var class="var">phon</var> =</code> <strong class="def-name">sone2phon</strong> <code class="def-code-arguments">(<var class="var">sone</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sone2phon-2"><span><code class="def-type"><var class="var">phon</var> =</code> <strong class="def-name">sone2phon</strong> <code class="def-code-arguments">(<var class="var">sone</var>, <var class="var">standard</var>)</code></span></dt>
<dd><p>Convert from sone to phon.
</p>
<h4 class="subsubheading" id="Inputs-26">Inputs</h4>
<p><var class="var">sone</var> - Loudness level in sone
</p>
<p><var class="var">standard</var> - Standard to use in conversion. Options are
 &rsquo;ISO 532-1&rsquo; or &rsquo;ISO 532-2&rsquo;.
</p>
<p>&rsquo;ISO 532-1&rsquo; is used if no standard is provided.
</p>
<h4 class="subsubheading" id="Outputs-26">Outputs</h4>
<p><var class="var">sone</var> - Loudness level in sone
</p>
<h4 class="subsubheading" id="Examples-17">Examples</h4>
<p>Convert 100 sone to phon
</p><div class="example">
<pre class="example-preformatted"><code class="code">phon = sone2phon(100)</code>
</pre></div>
<h4 class="subsubheading" id="References-7">References</h4>
<p>International Organization for Standardization., <cite class="cite">ISO 532-1 Acoustics – Methods for calculating loudness – Part 1: Zwicker method.</cite>
</p>
<p>International Organization for Standardization., <cite class="cite">ISO 532-2 Acoustics – Methods for calculating loudness – Part 2: Moore-Glasberg method.</cite>
</p>
<p>https://sengpielaudio.com/calculatorSonephon.htm
</p>
<p><strong class="strong">See also:</strong> sone2phon.
</p></dd></dl>
<hr>
</div>
</div>
</div>
<div class="appendix-level-extent" id="Copying">
<h2 class="appendix" id="GNU-General-Public-License">Appendix A GNU General Public License</h2>
<a class="index-entry-id" id="index-warranty"></a>
<a class="index-entry-id" id="index-copyright"></a>
<div class="center">Version 3, 29 June 2007
</div>
<div class="display">
<pre class="display-preformatted">Copyright &copy; 2007 Free Software Foundation, Inc. <a class="url" href="http://fsf.org/">http://fsf.org/</a>
Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.
</pre></div>
<h3 class="heading" id="Preamble">Preamble</h3>
<p>The GNU General Public License is a free, copyleft license for
software and other kinds of works.
</p>
<p>The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom
to share and change all versions of a program&mdash;to make sure it remains
free software for all its users.  We, the Free Software Foundation,
use the GNU General Public License for most of our software; it
applies also to any other work released this way by its authors.  You
can apply it to your programs, too.
</p>
<p>When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
them if you wish), that you receive source code or can get it if you
want it, that you can change the software or use pieces of it in new
free programs, and that you know you can do these things.
</p>
<p>To protect your rights, we need to prevent others from denying you
these rights or asking you to surrender the rights.  Therefore, you
have certain responsibilities if you distribute copies of the
software, or if you modify it: responsibilities to respect the freedom
of others.
</p>
<p>For example, if you distribute copies of such a program, whether
gratis or for a fee, you must pass on to the recipients the same
freedoms that you received.  You must make sure that they, too,
receive or can get the source code.  And you must show them these
terms so they know their rights.
</p>
<p>Developers that use the GNU GPL protect your rights with two steps:
(1) assert copyright on the software, and (2) offer you this License
giving you legal permission to copy, distribute and/or modify it.
</p>
<p>For the developers&rsquo; and authors&rsquo; protection, the GPL clearly explains
that there is no warranty for this free software.  For both users&rsquo; and
authors&rsquo; sake, the GPL requires that modified versions be marked as
changed, so that their problems will not be attributed erroneously to
authors of previous versions.
</p>
<p>Some devices are designed to deny users access to install or run
modified versions of the software inside them, although the
manufacturer can do so.  This is fundamentally incompatible with the
aim of protecting users&rsquo; freedom to change the software.  The
systematic pattern of such abuse occurs in the area of products for
individuals to use, which is precisely where it is most unacceptable.
Therefore, we have designed this version of the GPL to prohibit the
practice for those products.  If such problems arise substantially in
other domains, we stand ready to extend this provision to those
domains in future versions of the GPL, as needed to protect the
freedom of users.
</p>
<p>Finally, every program is threatened constantly by software patents.
States should not allow patents to restrict development and use of
software on general-purpose computers, but in those that do, we wish
to avoid the special danger that patents applied to a free program
could make it effectively proprietary.  To prevent this, the GPL
assures that patents cannot be used to render the program non-free.
</p>
<p>The precise terms and conditions for copying, distribution and
modification follow.
</p>
<h3 class="heading" id="TERMS-AND-CONDITIONS">TERMS AND CONDITIONS</h3>
<ol class="enumerate" start="0">
<li> Definitions.
<p>&ldquo;This License&rdquo; refers to version 3 of the GNU General Public License.
</p>
<p>&ldquo;Copyright&rdquo; also means copyright-like laws that apply to other kinds
of works, such as semiconductor masks.
</p>
<p>&ldquo;The Program&rdquo; refers to any copyrightable work licensed under this
License.  Each licensee is addressed as &ldquo;you&rdquo;.  &ldquo;Licensees&rdquo; and
&ldquo;recipients&rdquo; may be individuals or organizations.
</p>
<p>To &ldquo;modify&rdquo; a work means to copy from or adapt all or part of the work
in a fashion requiring copyright permission, other than the making of
an exact copy.  The resulting work is called a &ldquo;modified version&rdquo; of
the earlier work or a work &ldquo;based on&rdquo; the earlier work.
</p>
<p>A &ldquo;covered work&rdquo; means either the unmodified Program or a work based
on the Program.
</p>
<p>To &ldquo;propagate&rdquo; a work means to do anything with it that, without
permission, would make you directly or secondarily liable for
infringement under applicable copyright law, except executing it on a
computer or modifying a private copy.  Propagation includes copying,
distribution (with or without modification), making available to the
public, and in some countries other activities as well.
</p>
<p>To &ldquo;convey&rdquo; a work means any kind of propagation that enables other
parties to make or receive copies.  Mere interaction with a user
through a computer network, with no transfer of a copy, is not
conveying.
</p>
<p>An interactive user interface displays &ldquo;Appropriate Legal Notices&rdquo; to
the extent that it includes a convenient and prominently visible
feature that (1) displays an appropriate copyright notice, and (2)
tells the user that there is no warranty for the work (except to the
extent that warranties are provided), that licensees may convey the
work under this License, and how to view a copy of this License.  If
the interface presents a list of user commands or options, such as a
menu, a prominent item in the list meets this criterion.
</p>
</li><li> Source Code.
<p>The &ldquo;source code&rdquo; for a work means the preferred form of the work for
making modifications to it.  &ldquo;Object code&rdquo; means any non-source form
of a work.
</p>
<p>A &ldquo;Standard Interface&rdquo; means an interface that either is an official
standard defined by a recognized standards body, or, in the case of
interfaces specified for a particular programming language, one that
is widely used among developers working in that language.
</p>
<p>The &ldquo;System Libraries&rdquo; of an executable work include anything, other
than the work as a whole, that (a) is included in the normal form of
packaging a Major Component, but which is not part of that Major
Component, and (b) serves only to enable use of the work with that
Major Component, or to implement a Standard Interface for which an
implementation is available to the public in source code form.  A
&ldquo;Major Component&rdquo;, in this context, means a major essential component
(kernel, window system, and so on) of the specific operating system
(if any) on which the executable work runs, or a compiler used to
produce the work, or an object code interpreter used to run it.
</p>
<p>The &ldquo;Corresponding Source&rdquo; for a work in object code form means all
the source code needed to generate, install, and (for an executable
work) run the object code and to modify the work, including scripts to
control those activities.  However, it does not include the work&rsquo;s
System Libraries, or general-purpose tools or generally available free
programs which are used unmodified in performing those activities but
which are not part of the work.  For example, Corresponding Source
includes interface definition files associated with source files for
the work, and the source code for shared libraries and dynamically
linked subprograms that the work is specifically designed to require,
such as by intimate data communication or control flow between those
subprograms and other parts of the work.
</p>
<p>The Corresponding Source need not include anything that users can
regenerate automatically from other parts of the Corresponding Source.
</p>
<p>The Corresponding Source for a work in source code form is that same
work.
</p>
</li><li> Basic Permissions.
<p>All rights granted under this License are granted for the term of
copyright on the Program, and are irrevocable provided the stated
conditions are met.  This License explicitly affirms your unlimited
permission to run the unmodified Program.  The output from running a
covered work is covered by this License only if the output, given its
content, constitutes a covered work.  This License acknowledges your
rights of fair use or other equivalent, as provided by copyright law.
</p>
<p>You may make, run and propagate covered works that you do not convey,
without conditions so long as your license otherwise remains in force.
You may convey covered works to others for the sole purpose of having
them make modifications exclusively for you, or provide you with
facilities for running those works, provided that you comply with the
terms of this License in conveying all material for which you do not
control copyright.  Those thus making or running the covered works for
you must do so exclusively on your behalf, under your direction and
control, on terms that prohibit them from making any copies of your
copyrighted material outside their relationship with you.
</p>
<p>Conveying under any other circumstances is permitted solely under the
conditions stated below.  Sublicensing is not allowed; section 10
makes it unnecessary.
</p>
</li><li> Protecting Users&rsquo; Legal Rights From Anti-Circumvention Law.
<p>No covered work shall be deemed part of an effective technological
measure under any applicable law fulfilling obligations under article
11 of the WIPO copyright treaty adopted on 20 December 1996, or
similar laws prohibiting or restricting circumvention of such
measures.
</p>
<p>When you convey a covered work, you waive any legal power to forbid
circumvention of technological measures to the extent such
circumvention is effected by exercising rights under this License with
respect to the covered work, and you disclaim any intention to limit
operation or modification of the work as a means of enforcing, against
the work&rsquo;s users, your or third parties&rsquo; legal rights to forbid
circumvention of technological measures.
</p>
</li><li> Conveying Verbatim Copies.
<p>You may convey verbatim copies of the Program&rsquo;s source code as you
receive it, in any medium, provided that you conspicuously and
appropriately publish on each copy an appropriate copyright notice;
keep intact all notices stating that this License and any
non-permissive terms added in accord with section 7 apply to the code;
keep intact all notices of the absence of any warranty; and give all
recipients a copy of this License along with the Program.
</p>
<p>You may charge any price or no price for each copy that you convey,
and you may offer support or warranty protection for a fee.
</p>
</li><li> Conveying Modified Source Versions.
<p>You may convey a work based on the Program, or the modifications to
produce it from the Program, in the form of source code under the
terms of section 4, provided that you also meet all of these
conditions:
</p>
<ol class="enumerate" type="a" start="1">
<li> The work must carry prominent notices stating that you modified it,
and giving a relevant date.
</li><li> The work must carry prominent notices stating that it is released
under this License and any conditions added under section 7.  This
requirement modifies the requirement in section 4 to &ldquo;keep intact all
notices&rdquo;.
</li><li> You must license the entire work, as a whole, under this License to
anyone who comes into possession of a copy.  This License will
therefore apply, along with any applicable section 7 additional terms,
to the whole of the work, and all its parts, regardless of how they
are packaged.  This License gives no permission to license the work in
any other way, but it does not invalidate such permission if you have
separately received it.
</li><li> If the work has interactive user interfaces, each must display
Appropriate Legal Notices; however, if the Program has interactive
interfaces that do not display Appropriate Legal Notices, your work
need not make them do so.
</li></ol>
<p>A compilation of a covered work with other separate and independent
works, which are not by their nature extensions of the covered work,
and which are not combined with it such as to form a larger program,
in or on a volume of a storage or distribution medium, is called an
&ldquo;aggregate&rdquo; if the compilation and its resulting copyright are not
used to limit the access or legal rights of the compilation&rsquo;s users
beyond what the individual works permit.  Inclusion of a covered work
in an aggregate does not cause this License to apply to the other
parts of the aggregate.
</p>
</li><li> Conveying Non-Source Forms.
<p>You may convey a covered work in object code form under the terms of
sections 4 and 5, provided that you also convey the machine-readable
Corresponding Source under the terms of this License, in one of these
ways:
</p>
<ol class="enumerate" type="a" start="1">
<li> Convey the object code in, or embodied in, a physical product
(including a physical distribution medium), accompanied by the
Corresponding Source fixed on a durable physical medium customarily
used for software interchange.
</li><li> Convey the object code in, or embodied in, a physical product
(including a physical distribution medium), accompanied by a written
offer, valid for at least three years and valid for as long as you
offer spare parts or customer support for that product model, to give
anyone who possesses the object code either (1) a copy of the
Corresponding Source for all the software in the product that is
covered by this License, on a durable physical medium customarily used
for software interchange, for a price no more than your reasonable
cost of physically performing this conveying of source, or (2) access
to copy the Corresponding Source from a network server at no charge.
</li><li> Convey individual copies of the object code with a copy of the written
offer to provide the Corresponding Source.  This alternative is
allowed only occasionally and noncommercially, and only if you
received the object code with such an offer, in accord with subsection
6b.
</li><li> Convey the object code by offering access from a designated place
(gratis or for a charge), and offer equivalent access to the
Corresponding Source in the same way through the same place at no
further charge.  You need not require recipients to copy the
Corresponding Source along with the object code.  If the place to copy
the object code is a network server, the Corresponding Source may be
on a different server (operated by you or a third party) that supports
equivalent copying facilities, provided you maintain clear directions
next to the object code saying where to find the Corresponding Source.
Regardless of what server hosts the Corresponding Source, you remain
obligated to ensure that it is available for as long as needed to
satisfy these requirements.
</li><li> Convey the object code using peer-to-peer transmission, provided you
inform other peers where the object code and Corresponding Source of
the work are being offered to the general public at no charge under
subsection 6d.
</li></ol>
<p>A separable portion of the object code, whose source code is excluded
from the Corresponding Source as a System Library, need not be
included in conveying the object code work.
</p>
<p>A &ldquo;User Product&rdquo; is either (1) a &ldquo;consumer product&rdquo;, which means any
tangible personal property which is normally used for personal,
family, or household purposes, or (2) anything designed or sold for
incorporation into a dwelling.  In determining whether a product is a
consumer product, doubtful cases shall be resolved in favor of
coverage.  For a particular product received by a particular user,
&ldquo;normally used&rdquo; refers to a typical or common use of that class of
product, regardless of the status of the particular user or of the way
in which the particular user actually uses, or expects or is expected
to use, the product.  A product is a consumer product regardless of
whether the product has substantial commercial, industrial or
non-consumer uses, unless such uses represent the only significant
mode of use of the product.
</p>
<p>&ldquo;Installation Information&rdquo; for a User Product means any methods,
procedures, authorization keys, or other information required to
install and execute modified versions of a covered work in that User
Product from a modified version of its Corresponding Source.  The
information must suffice to ensure that the continued functioning of
the modified object code is in no case prevented or interfered with
solely because modification has been made.
</p>
<p>If you convey an object code work under this section in, or with, or
specifically for use in, a User Product, and the conveying occurs as
part of a transaction in which the right of possession and use of the
User Product is transferred to the recipient in perpetuity or for a
fixed term (regardless of how the transaction is characterized), the
Corresponding Source conveyed under this section must be accompanied
by the Installation Information.  But this requirement does not apply
if neither you nor any third party retains the ability to install
modified object code on the User Product (for example, the work has
been installed in ROM).
</p>
<p>The requirement to provide Installation Information does not include a
requirement to continue to provide support service, warranty, or
updates for a work that has been modified or installed by the
recipient, or for the User Product in which it has been modified or
installed.  Access to a network may be denied when the modification
itself materially and adversely affects the operation of the network
or violates the rules and protocols for communication across the
network.
</p>
<p>Corresponding Source conveyed, and Installation Information provided,
in accord with this section must be in a format that is publicly
documented (and with an implementation available to the public in
source code form), and must require no special password or key for
unpacking, reading or copying.
</p>
</li><li> Additional Terms.
<p>&ldquo;Additional permissions&rdquo; are terms that supplement the terms of this
License by making exceptions from one or more of its conditions.
Additional permissions that are applicable to the entire Program shall
be treated as though they were included in this License, to the extent
that they are valid under applicable law.  If additional permissions
apply only to part of the Program, that part may be used separately
under those permissions, but the entire Program remains governed by
this License without regard to the additional permissions.
</p>
<p>When you convey a copy of a covered work, you may at your option
remove any additional permissions from that copy, or from any part of
it.  (Additional permissions may be written to require their own
removal in certain cases when you modify the work.)  You may place
additional permissions on material, added by you to a covered work,
for which you have or can give appropriate copyright permission.
</p>
<p>Notwithstanding any other provision of this License, for material you
add to a covered work, you may (if authorized by the copyright holders
of that material) supplement the terms of this License with terms:
</p>
<ol class="enumerate" type="a" start="1">
<li> Disclaiming warranty or limiting liability differently from the terms
of sections 15 and 16 of this License; or
</li><li> Requiring preservation of specified reasonable legal notices or author
attributions in that material or in the Appropriate Legal Notices
displayed by works containing it; or
</li><li> Prohibiting misrepresentation of the origin of that material, or
requiring that modified versions of such material be marked in
reasonable ways as different from the original version; or
</li><li> Limiting the use for publicity purposes of names of licensors or
authors of the material; or
</li><li> Declining to grant rights under trademark law for use of some trade
names, trademarks, or service marks; or
</li><li> Requiring indemnification of licensors and authors of that material by
anyone who conveys the material (or modified versions of it) with
contractual assumptions of liability to the recipient, for any
liability that these contractual assumptions directly impose on those
licensors and authors.
</li></ol>
<p>All other non-permissive additional terms are considered &ldquo;further
restrictions&rdquo; within the meaning of section 10.  If the Program as you
received it, or any part of it, contains a notice stating that it is
governed by this License along with a term that is a further
restriction, you may remove that term.  If a license document contains
a further restriction but permits relicensing or conveying under this
License, you may add to a covered work material governed by the terms
of that license document, provided that the further restriction does
not survive such relicensing or conveying.
</p>
<p>If you add terms to a covered work in accord with this section, you
must place, in the relevant source files, a statement of the
additional terms that apply to those files, or a notice indicating
where to find the applicable terms.
</p>
<p>Additional terms, permissive or non-permissive, may be stated in the
form of a separately written license, or stated as exceptions; the
above requirements apply either way.
</p>
</li><li> Termination.
<p>You may not propagate or modify a covered work except as expressly
provided under this License.  Any attempt otherwise to propagate or
modify it is void, and will automatically terminate your rights under
this License (including any patent licenses granted under the third
paragraph of section 11).
</p>
<p>However, if you cease all violation of this License, then your license
from a particular copyright holder is reinstated (a) provisionally,
unless and until the copyright holder explicitly and finally
terminates your license, and (b) permanently, if the copyright holder
fails to notify you of the violation by some reasonable means prior to
60 days after the cessation.
</p>
<p>Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from that
copyright holder, and you cure the violation prior to 30 days after
your receipt of the notice.
</p>
<p>Termination of your rights under this section does not terminate the
licenses of parties who have received copies or rights from you under
this License.  If your rights have been terminated and not permanently
reinstated, you do not qualify to receive new licenses for the same
material under section 10.
</p>
</li><li> Acceptance Not Required for Having Copies.
<p>You are not required to accept this License in order to receive or run
a copy of the Program.  Ancillary propagation of a covered work
occurring solely as a consequence of using peer-to-peer transmission
to receive a copy likewise does not require acceptance.  However,
nothing other than this License grants you permission to propagate or
modify any covered work.  These actions infringe copyright if you do
not accept this License.  Therefore, by modifying or propagating a
covered work, you indicate your acceptance of this License to do so.
</p>
</li><li> Automatic Licensing of Downstream Recipients.
<p>Each time you convey a covered work, the recipient automatically
receives a license from the original licensors, to run, modify and
propagate that work, subject to this License.  You are not responsible
for enforcing compliance by third parties with this License.
</p>
<p>An &ldquo;entity transaction&rdquo; is a transaction transferring control of an
organization, or substantially all assets of one, or subdividing an
organization, or merging organizations.  If propagation of a covered
work results from an entity transaction, each party to that
transaction who receives a copy of the work also receives whatever
licenses to the work the party&rsquo;s predecessor in interest had or could
give under the previous paragraph, plus a right to possession of the
Corresponding Source of the work from the predecessor in interest, if
the predecessor has it or can get it with reasonable efforts.
</p>
<p>You may not impose any further restrictions on the exercise of the
rights granted or affirmed under this License.  For example, you may
not impose a license fee, royalty, or other charge for exercise of
rights granted under this License, and you may not initiate litigation
(including a cross-claim or counterclaim in a lawsuit) alleging that
any patent claim is infringed by making, using, selling, offering for
sale, or importing the Program or any portion of it.
</p>
</li><li> Patents.
<p>A &ldquo;contributor&rdquo; is a copyright holder who authorizes use under this
License of the Program or a work on which the Program is based.  The
work thus licensed is called the contributor&rsquo;s &ldquo;contributor version&rdquo;.
</p>
<p>A contributor&rsquo;s &ldquo;essential patent claims&rdquo; are all patent claims owned
or controlled by the contributor, whether already acquired or
hereafter acquired, that would be infringed by some manner, permitted
by this License, of making, using, or selling its contributor version,
but do not include claims that would be infringed only as a
consequence of further modification of the contributor version.  For
purposes of this definition, &ldquo;control&rdquo; includes the right to grant
patent sublicenses in a manner consistent with the requirements of
this License.
</p>
<p>Each contributor grants you a non-exclusive, worldwide, royalty-free
patent license under the contributor&rsquo;s essential patent claims, to
make, use, sell, offer for sale, import and otherwise run, modify and
propagate the contents of its contributor version.
</p>
<p>In the following three paragraphs, a &ldquo;patent license&rdquo; is any express
agreement or commitment, however denominated, not to enforce a patent
(such as an express permission to practice a patent or covenant not to
sue for patent infringement).  To &ldquo;grant&rdquo; such a patent license to a
party means to make such an agreement or commitment not to enforce a
patent against the party.
</p>
<p>If you convey a covered work, knowingly relying on a patent license,
and the Corresponding Source of the work is not available for anyone
to copy, free of charge and under the terms of this License, through a
publicly available network server or other readily accessible means,
then you must either (1) cause the Corresponding Source to be so
available, or (2) arrange to deprive yourself of the benefit of the
patent license for this particular work, or (3) arrange, in a manner
consistent with the requirements of this License, to extend the patent
license to downstream recipients.  &ldquo;Knowingly relying&rdquo; means you have
actual knowledge that, but for the patent license, your conveying the
covered work in a country, or your recipient&rsquo;s use of the covered work
in a country, would infringe one or more identifiable patents in that
country that you have reason to believe are valid.
</p>
<p>If, pursuant to or in connection with a single transaction or
arrangement, you convey, or propagate by procuring conveyance of, a
covered work, and grant a patent license to some of the parties
receiving the covered work authorizing them to use, propagate, modify
or convey a specific copy of the covered work, then the patent license
you grant is automatically extended to all recipients of the covered
work and works based on it.
</p>
<p>A patent license is &ldquo;discriminatory&rdquo; if it does not include within the
scope of its coverage, prohibits the exercise of, or is conditioned on
the non-exercise of one or more of the rights that are specifically
granted under this License.  You may not convey a covered work if you
are a party to an arrangement with a third party that is in the
business of distributing software, under which you make payment to the
third party based on the extent of your activity of conveying the
work, and under which the third party grants, to any of the parties
who would receive the covered work from you, a discriminatory patent
license (a) in connection with copies of the covered work conveyed by
you (or copies made from those copies), or (b) primarily for and in
connection with specific products or compilations that contain the
covered work, unless you entered into that arrangement, or that patent
license was granted, prior to 28 March 2007.
</p>
<p>Nothing in this License shall be construed as excluding or limiting
any implied license or other defenses to infringement that may
otherwise be available to you under applicable patent law.
</p>
</li><li> No Surrender of Others&rsquo; Freedom.
<p>If conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot convey
a covered work so as to satisfy simultaneously your obligations under
this License and any other pertinent obligations, then as a
consequence you may not convey it at all.  For example, if you agree
to terms that obligate you to collect a royalty for further conveying
from those to whom you convey the Program, the only way you could
satisfy both those terms and this License would be to refrain entirely
from conveying the Program.
</p>
</li><li> Use with the GNU Affero General Public License.
<p>Notwithstanding any other provision of this License, you have
permission to link or combine any covered work with a work licensed
under version 3 of the GNU Affero General Public License into a single
combined work, and to convey the resulting work.  The terms of this
License will continue to apply to the part which is the covered work,
but the special requirements of the GNU Affero General Public License,
section 13, concerning interaction through a network will apply to the
combination as such.
</p>
</li><li> Revised Versions of this License.
<p>The Free Software Foundation may publish revised and/or new versions
of the GNU General Public License from time to time.  Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns.
</p>
<p>Each version is given a distinguishing version number.  If the Program
specifies that a certain numbered version of the GNU General Public
License &ldquo;or any later version&rdquo; applies to it, you have the option of
following the terms and conditions either of that numbered version or
of any later version published by the Free Software Foundation.  If
the Program does not specify a version number of the GNU General
Public License, you may choose any version ever published by the Free
Software Foundation.
</p>
<p>If the Program specifies that a proxy can decide which future versions
of the GNU General Public License can be used, that proxy&rsquo;s public
statement of acceptance of a version permanently authorizes you to
choose that version for the Program.
</p>
<p>Later license versions may give you additional or different
permissions.  However, no additional obligations are imposed on any
author or copyright holder as a result of your choosing to follow a
later version.
</p>
</li><li> Disclaimer of Warranty.
<p>THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM &ldquo;AS IS&rdquo; WITHOUT
WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND
PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE PROGRAM PROVE
DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
CORRECTION.
</p>
</li><li> Limitation of Liability.
<p>IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR
CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT
NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR
LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM
TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER
PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
</p>
</li><li> Interpretation of Sections 15 and 16.
<p>If the disclaimer of warranty and limitation of liability provided
above cannot be given local legal effect according to their terms,
reviewing courts shall apply local law that most closely approximates
an absolute waiver of all civil liability in connection with the
Program, unless a warranty or assumption of liability accompanies a
copy of the Program in return for a fee.
</p>
</li></ol>
<h3 class="heading" id="END-OF-TERMS-AND-CONDITIONS">END OF TERMS AND CONDITIONS</h3>
<h3 class="heading" id="How-to-Apply-These-Terms-to-Your-New-Programs">How to Apply These Terms to Your New Programs</h3>
<p>If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these
terms.
</p>
<p>To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
state the exclusion of warranty; and each file should have at least
the &ldquo;copyright&rdquo; line and a pointer to where the full notice is found.
</p>
<div class="example smallexample">
<pre class="example-preformatted"><var class="var">one line to give the program's name and a brief idea of what it does.</var>  
Copyright (C) <var class="var">year</var> <var class="var">name of author</var>
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.
This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <a class="url" href="http://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>.
</pre></div>
<p>Also add information on how to contact you by electronic and paper mail.
</p>
<p>If the program does terminal interaction, make it output a short
notice like this when it starts in an interactive mode:
</p>
<div class="example smallexample">
<pre class="example-preformatted"><var class="var">program</var> Copyright (C) <var class="var">year</var> <var class="var">name of author</var> 
This program comes with ABSOLUTELY NO WARRANTY; for details type &lsquo;<samp class="samp">show w</samp>&rsquo;.
This is free software, and you are welcome to redistribute it
under certain conditions; type &lsquo;<samp class="samp">show c</samp>&rsquo; for details.
</pre></div>
<p>The hypothetical commands &lsquo;<samp class="samp">show w</samp>&rsquo; and &lsquo;<samp class="samp">show c</samp>&rsquo; should show
the appropriate parts of the General Public License.  Of course, your
program&rsquo;s commands might be different; for a GUI interface, you would
use an &ldquo;about box&rdquo;.
</p>
<p>You should also get your employer (if you work as a programmer) or school,
if any, to sign a &ldquo;copyright disclaimer&rdquo; for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<a class="url" href="http://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>.
</p>
<p>The GNU General Public License does not permit incorporating your
program into proprietary programs.  If your program is a subroutine
library, you may consider it more useful to permit linking proprietary
applications with the library.  If this is what you want to do, use
the GNU Lesser General Public License instead of this License.  But
first, please read <a class="url" href="http://www.gnu.org/philosophy/why-not-lgpl.html">http://www.gnu.org/philosophy/why-not-lgpl.html</a>.
</p>
<hr>
</div>
<div class="unnumbered-level-extent" id="Index">
<h2 class="unnumbered" id="Index-1">Index</h2>
 
<div class="printindex cp-printindex">
<table class="cp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Index_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-H"><b>H</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-I"><b>I</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-L"><b>L</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-M"><b>M</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-O"><b>O</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-P"><b>P</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-S"><b>S</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-W"><b>W</b></a>
 &nbsp; 
</td></tr></table>
<table class="cp-entries-printindex">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><th class="sections-header-printindex">Section</th></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-A">A</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-audioOscillator">audioOscillator</a></td><td class="printindex-index-section"><a href="#Waveform-Generation">Waveform Generation</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-B">B</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-bark2hz">bark2hz</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Basic-Usage-Overview">Basic Usage Overview</a></td><td class="printindex-index-section"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-C">C</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Conversion-Functionality">Conversion Functionality</a></td><td class="printindex-index-section"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copyright">copyright</a></td><td class="printindex-index-section"><a href="#Copying">Copying</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-D">D</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Domain-Conversion">Domain Conversion</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-E">E</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Enumerations">Enumerations</a></td><td class="printindex-index-section"><a href="#Enumerations">Enumerations</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-erb2hz">erb2hz</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-F">F</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Function-Reference">Function Reference</a></td><td class="printindex-index-section"><a href="#Function-Reference">Function Reference</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-H">H</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-hasdata">hasdata</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-hz2bark">hz2bark</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-hz2erb">hz2erb</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-hz2mel">hz2mel</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-I">I</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Installing-and-loading">Installing and loading</a></td><td class="printindex-index-section"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-ismidifile">ismidifile</a></td><td class="printindex-index-section"><a href="#MIDI-File-I_002fO">MIDI File I/O</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-L">L</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Loading">Loading</a></td><td class="printindex-index-section"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-M">M</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-mel2hz">mel2hz</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-MIDI-Controller-Interface">MIDI Controller Interface</a></td><td class="printindex-index-section"><a href="#MIDI-Controller-Interface">MIDI Controller Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-MIDI-Device-Interface">MIDI Device Interface</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-MIDI-File-I_002fO">MIDI File I/O</a></td><td class="printindex-index-section"><a href="#MIDI-File-I_002fO">MIDI File I/O</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-MIDI-Functionality">MIDI Functionality</a></td><td class="printindex-index-section"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midicallback">midicallback</a></td><td class="printindex-index-section"><a href="#MIDI-Controller-Interface">MIDI Controller Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midicontrols">midicontrols</a></td><td class="printindex-index-section"><a href="#MIDI-Controller-Interface">MIDI Controller Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-mididevice">mididevice</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-mididevinfo">mididevinfo</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midifileinfo">midifileinfo</a></td><td class="printindex-index-section"><a href="#MIDI-File-I_002fO">MIDI File I/O</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midifileread">midifileread</a></td><td class="printindex-index-section"><a href="#MIDI-File-I_002fO">MIDI File I/O</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midifilewrite">midifilewrite</a></td><td class="printindex-index-section"><a href="#MIDI-File-I_002fO">MIDI File I/O</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midiflush">midiflush</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midiid">midiid</a></td><td class="printindex-index-section"><a href="#MIDI-Controller-Interface">MIDI Controller Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midimsg">midimsg</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midimsgtype">midimsgtype</a></td><td class="printindex-index-section"><a href="#Enumerations">Enumerations</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midiread">midiread</a></td><td class="printindex-index-section"><a href="#MIDI-Controller-Interface">MIDI Controller Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midireceive">midireceive</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midisend">midisend</a></td><td class="printindex-index-section"><a href="#MIDI-Device-Interface">MIDI Device Interface</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-midisync">midisync</a></td><td class="printindex-index-section"><a href="#MIDI-Controller-Interface">MIDI Controller Interface</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-O">O</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Off_002dline-install">Off-line install</a></td><td class="printindex-index-section"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Online-install">Online install</a></td><td class="printindex-index-section"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-P">P</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-phon2sone">phon2sone</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-S">S</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-sone2phon">sone2phon</a></td><td class="printindex-index-section"><a href="#Domain-Conversion">Domain Conversion</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Index_cp_letter-W">W</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-warranty">warranty</a></td><td class="printindex-index-section"><a href="#Copying">Copying</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Waveform-Generation">Waveform Generation</a></td><td class="printindex-index-section"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Waveform-Generation-1">Waveform Generation</a></td><td class="printindex-index-section"><a href="#Waveform-Generation">Waveform Generation</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-Windows-install">Windows install</a></td><td class="printindex-index-section"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
</table>
<table class="cp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Index_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-H"><b>H</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-I"><b>I</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-L"><b>L</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-M"><b>M</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-O"><b>O</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-P"><b>P</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-S"><b>S</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Index_cp_letter-W"><b>W</b></a>
 &nbsp; 
</td></tr></table>
</div>
 
</div>
</div>
