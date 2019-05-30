function X = ctft(s, t, f)
% X = CTFT(s, t, f)
% Performs Continuous-Time Fourier Transform on signal s.
%
% Input     Size     Description
% --------------------------------------------
% s      : [1 x N] - the input signal
% t      : [1 x N] - the time vector (our time axis)
% f      : [1 x L] - the frequency vector Hz
%
% Output    Size     Description
% --------------------------------------------
% X      : [1 x L] - the Continuous Time F.T.
% 
% Usage: For real signals:
%        [s, fs] = wavread('sample.wav');
%        seg = s(500:900);
%        t = 0:1/fs:length(seg)/fs - 1/fs;
%        f = [1:1:fs/2];
%        X = ctft(seg, t, f);
%  
%        For synthetic signals:
%        Dt = 0.01;
%        t = 0:Dt:10;
%        x = 2*cos(2*pi*100*t);
%        f = 1:1:500;
%        X = ctft(x, t, f);
%
% See also: fft, ifft
%
% @ G.P. Kafentzis

s = s(:).';
M = exp(-1i*t'*2*pi*f); % Fourier Matrix
X = (t(2)-t(1))*s*M;    % Fourier Transform

figure; 
subplot(3,1,1); plot(t, s, 'LineWidth', 1); ylabel('Amplitude');
title('Signal in time'); xlabel('Time (s)'); grid;
subplot(3,1,2); plot(f, abs(X), 'LineWidth', 2); ylabel('Magnitude');
title('Magnitude of CT FT'); xlabel('Frequency (Hz)'); grid;
subplot(3,1,3); plot(f, unwrap(angle(X)), 'LineWidth', 2); ylabel('Radians');
title('Phase of CT FT'); xlabel('Frequency (Hz)'); grid;