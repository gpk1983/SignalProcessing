omega = -pi:0.01:pi;                                 % Άξονας συχνότητας ω
num = conv([1 -0.5], [1 -0.25]);                     % Αριθμητής
den = conv([1 -0.2], [1 -0.8]);                      % Παρονομαστής
H = freqz(num, den, omega);                          % H(e^jω)

subplot(211); plot(omega, abs(H)); grid;             % Απόκριση πλάτους
xlabel('Frequency (rad)'); ylabel('Magnitude');      % Ετικέτες
title('Magnitude Response');                         % Τίτλος
subplot(212); plot(omega, angle(H)); grid;           % Απόκριση φάσης
xlabel('Frequency (rad)'); ylabel('Phase (rad)');    % Ετικέτες
title('Phase Response');                             % Τίτλος
