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
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## usage: [x, fs] = aucapture(t, fs, channels)
##
## Capture an audio event at the given sample rate fs.  This uses an
## endpoint detection routine to eliminate the silence surrounding the
## event. On return, data contains the samples, one column per channel
## and rate contains the sample rate used. Note that the sample rate
## used may not match the requested sample rate. Use the returned rate
## for further processing.  Similarly, the actual number of samples and
## channels may not match the request.
##
## Time defaults to 10s, rate defaults to 8000 Hz, and channels defaults
## to 1

## TODO: Consider combining with aurecord.m, with capture indicated by
## TODO:      time t=[] or t=0 or t<0, or maybe aurecord_usecapture
function [data, rate] = aucapture(time, rate, channels)

  if nargin>3
    usage("[x, fs] = aucapture([t, fs, channels]);");
  end
  if nargin<1, time = 10.0; end
  if nargin<2, rate = 8000; end
  if nargin<3, channels = 1; end

  com = sprintf("aurecord -e -r %d -c %d -t %f", rate, channels, time)
  fid = popen(com, "r");
  rate = fread(fid, 1, 'long');
  channels = fread(fid, 1, 'long');
  if channels == 0
    pclose(fid);
    error("aurecord failed -- perhaps audio device is in use?\n");
  end;
  data = fread(fid, Inf, 'short')/32768;
  data = reshape(data, length(data)/channels, channels);
  pclose(fid);
end
