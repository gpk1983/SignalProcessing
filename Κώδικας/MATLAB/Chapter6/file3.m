W = -4*(2*pi):0.01:4*(2*pi);                             % Άξονας συχνότητας ω
H = freqs(conv([1 3], [1 -1]), conv([1 1], [1 0.5]), W); % Απόκριση συχνότητας
subplot(211); plot(W/(2*pi), abs(H)); grid;              % Απόκριση πλάτους
xlabel('Frequency (Hz)'); ylabel('Magnitude');           % Ετικέτες
title('Magnitude Response');                             % Τίτλος
subplot(212); plot(W/(2*pi), angle(H)); grid;            % Απόκριση φάσης
xlabel('Frequency (Hz)'); ylabel('Phase (rad)');         % Ετικέτες
title('Phase Response');                                 % Τίτλος
