function wavwrite(snd,fs,nbits,outfile);
% wavwrite(snd,fs,nbits,outfile);
%
% Write .wav file.
% fs = sampling rate in Hz.
% nbits = bits per sample.
% Input sound snd should be scaled to lie in [-1.0, 1.0).

% merge with ausave.m
% public domain

if nargin==3, outfile=nbits; nbits=16; end
if nargin==2, outfile=fs; fs=8000; nbits=16; end

%  disp('*** WAVWRITE NOT YET WRITTEN -- CALLING WRITESOUND');
%  writesound(snd,fs,outfile);
  
[m,n] = size(snd);
% Sound matrices assumed tall and thin:
if n>m
  ntmp=n; n=m; m=ntmp; 
  if n>1
    disp('wavwrite: TRANSPOSING sound matrix for standard disk order');
    snd = snd';
  end
end
nsamps = m;
nchans = n;
[dir,name,ext] = fileparts(outfile);
if isempty(ext), outfile = [outfile,'.wav']; end;
fpo = fopen(outfile,'w');
fwrite(fpo, 'RIFF','char');
bpsamp = nbits/8; % bytes per sample
nbytes = nsamps*nchans*bpsamp;
fwrite(fpo, nbytes,'int32');
subfmt = 'WAVE';
fwrite(fpo, subfmt,'char');
fmt = 'fmt ';
fwrite(fpo, fmt, 'char');

cl = 16; % chunk length
fwrite(fpo, cl, 'int32');
tmp=1;
fwrite(fpo, tmp, 'int16');
fwrite(fpo, nchans,'int16');
fwrite(fpo, fs, 'int32');
bpsec = fs*bpsamp; % bytes/sec
fwrite(fpo, bpsec, 'int32');
fwrite(fpo, bpsamp, 'int16'); % bytes per sample
fwrite(fpo, nbits, 'int16');
id = 'data';
fwrite(fpo, id, 'char');
fwrite(fpo, nbytes, 'int32');
nsampstotal = nsamps*nchans;
nsamps = nbytes/2;
datafmt = sprintf('int%d',nbits');
snd = snd' * (2^(nbits-1)-1);
fwrite(fpo,snd,datafmt);
fclose(fpo);
disp(sprintf('file %s written, %d bytes',outfile,nbytes));
