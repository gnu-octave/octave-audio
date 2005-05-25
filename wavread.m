function [snd, srate, nbits] = wavread(infile,nframes);
% [snd, srate, nbits] = wavread(infile,[nframes])
%
% Read .wav file into snd (size  (nchans,nsamples)).
% srate = sampling rate in Hz.
% nbits = bits per sample.
% optional nframes = no. samples to read (all channels)
%   (default = all samples in file).

% XXX FIXME XXX merge with auload
% This program is public domain
% Author: Julius O. Smith III

fpi = fopen(infile,'r');
id = fread(fpi, 1,'int32');
if (strcmp(id,'RIFF')!=0) 
  error(sprintf('%s not a WAV file',infile));
end
disp(sprintf('Input file \'%s\' is RIFF format:',infile));
nbytes = fread(fpi, 1,'int32');
disp(sprintf('\tTotal length = %d bytes',nbytes));
subfmt = fread(fpi, 1,'int32');
%  disp(sprintf('Subformat = %d',subfmt));
if (strcmp(subfmt,'WAVE')!=0) 
  error('*** Cannot handle subformat %s',subfmt);
end
fmt = fread(fpi, 1,'int32');
if (strcmp(fmt,'fmt ')!=0)
  error(sprintf('*** Expected \'fmt \' in header, but got \'',...
                fmt));
end

cl = fread(fpi, 1,'int32');
if (cl ~= 16) 
  error(sprintf('*** Expected format chunk length = 16 in soundfile header, but got %d',cl));
end

tmps = fread(fpi,1,'int16');
if (tmps != 1) 
  error(sprintf('*** Expected 01 in format chunk, but got %d',tmps));
end
nchans = fread(fpi,1,'int16');
disp(sprintf('\tNumber of channels = %d',nchans));

srate = fread(fpi,1,'int32');
disp(sprintf('\tSampling rate = %d Hz',srate));
tmpi = fread(fpi,1,'int32');
if (tmpi != 2*srate) 
  error(sprintf('*** %d bytes per second looks wrong. Expect %d',
  tmpi,2*srate));
end

bps = fread(fpi,1,'int16'); % bytes per sample
nbits = fread(fpi,1,'int16');

id = fread(fpi,1,'int32');
if (strcmp(id,'data')!=0) 
  error(sprintf('Did not find \'data\' ID where expected'));
end
nbytes = fread(fpi,1,'int32');
if (mod(nbytes,2)==1) 
  error(sprintf('*** Number of data bytes (%d) is ODD!',nbytes));
end
nsamps = nbytes/2;
disp(sprintf('\tData length = %d samples', nsamps));
if (mod(nsamps,nchans)~=0) 
  error(sprintf(['*** Number of channels (%d) does not divide nsamps ' ...
                 '(%d)!'],nchans,nsamps));
end

if nargin < 2
  nframes = nsamps/nchans;
elseif (nframes=='size') && (nargout = 1)
  nspc = (nbytes/2)/nchannels; % no. samples per channel
  snd=[nspc nchannels]; % should first arg = total samples instead?
  return; 
end

datafmt = sprintf('int%d',nbits');
snd = fread(fpi,[nchans,nframes],datafmt);
snd = snd' / (2^(nbits-1)-1); % Transpose for Matlab compatibility
