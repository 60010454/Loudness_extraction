clear;clc
 
[x,fs] = audioread('sawtooth_resamp.wav');

% % A-weighted filtering
x = filterA(x, fs);

% % Divide into frames of 1024 sample
frames = stride_dB(x);

% % Extract loudness of each frames
dB = dB_extract(frames,fs);

% % Average over each frames

loudness = mean(dB,2);

plot(loudness)
