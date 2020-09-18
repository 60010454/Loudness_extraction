function dB = dB_extract(x,fs)

%extract the envelope
smooth_sec = 0.01;  %"FAST" SPL is 1/8th of second.  "SLOW" is 1 second;
smooth_Hz = 1/smooth_sec;
[b,a]=butter(1,smooth_Hz/(fs/2),'low');  %design a Low-pass filter
x_env = sqrt(filter(b,a,x.^2));  %rectify, by squaring, and low-pass filter

%%% Compute dB
dB = 20*log10(x_env);
% dB =dB-20.7;
