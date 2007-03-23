## Copyright (C) 1999 Paul Kienzle
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

## usage: [x, fs] = aurecord(t, fs, channels)
##
## Record for the specified time at the given sample rate. Note that
## the sample rate used may not match the requested sample rate.  Use
## the returned rate instead of the requested value in further
## processing. Similarly, the actual number of samples and channels
## may not match the request, so check the size of the returned matrix.
##
## Fs defaults to 8000 Hz and channels defaults to 1. Time is measured
## in seconds.

## TODO: Consider converting into record.m
## TODO: Consider making this a .oct file, incorporating aurecord.cc
## TODO: Consider using aurecord_command='record %s', and read signal from /tmp/blah.wav
function [data, rate] = aurecord(time, rate, channels)

  if nargin<1 || nargin>3
    usage("[x, fs] = aurecord(t [, fs, channels])");
  end
  if nargin<2, rate = 8000; end;
  if nargin<3, channels = 1; end;

  fid=popen(sprintf("aurecord -r %d -c %d -t %f", rate, channels, \
		    time), "r");
  rate = fread(fid, 1, 'long');
  channels = fread(fid, 1, 'long');
  if channels == 0
    pclose(fid);
    error("aurecord failed -- perhaps audio device is in use?\n");
  end;
  data = fread(fid, Inf, 'short');
  if size(data,1) > 0 
    data = reshape(data'/32768, length(data)/channels, channels);
  end
end
