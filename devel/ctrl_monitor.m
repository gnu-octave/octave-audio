function control_monitor()

  [ctrlid, dev] = midiid()

  mididev = midicontrols(ctrlid, 'mididevice', dev)

  unwind_protect
    midicallback(mididev, @displayValue);
    printf("press a key to stop");
    pause
  unwind_protect_cleanup
    midicallback(mididev, []);
    clear mididev
  end_unwind_protect

endfunction

function displayValue(ctrl)
  midiread(ctrl)
endfunction
