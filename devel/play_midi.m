function play_midi(filename)

  if nargin < 1
    error ("no filename provided");
  endif

  devid = getpref("midi", "DefaultDevice", 0);
  mididev = mididevice(devid)

  unwind_protect
    midimsgs = midifileread(filename);
    midisend(mididev, midimsgs);
  unwind_protect_cleanup
    clear devid
  end_unwind_protect

endfunction
