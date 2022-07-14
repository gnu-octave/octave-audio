function record_midi(filename)

  if nargin < 1
    error ("no filename provided");
  endif

  devid = getpref("midi", "DefaultDevice", 0);
  mididev = mididevice(devid)
  midimsgs = midimsg(0);

  unwind_protect
    while true
      pause(1);
      msgs = midireceive(mididev)
      if !isempty(msgs)
        midimsgs = [midimsgs msgs];
      endif
    endwhile
  unwind_protect_cleanup
    clear devid

    if !isempty(midimsgs)
      printf("writing file %s...\n", filename);
      midifilewrite(filename, midimsgs);
    endif
  end_unwind_protect

endfunction
