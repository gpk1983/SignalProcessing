omega = 0:pi/600:pi;                                % Άξονας συχνότητας ω
num = [0.0181, 0.0543, 0.0543, 0.0181];             % Αριθμητής
den = [1, -1.76, 1.1829, -0.2781];                  % Παρονομαστής
H = freqz(num, den, omega);                         % H(e^jω)

subplot(211); plot(omega, abs(H)); grid;            % Απόκριση πλάτους
xlabel('Frequency (rad)'); ylabel('Magnitude');     % Ετικέτες
title('Magnitude Response');                        % Τίτλος
subplot(212); plot(omega, angle(H)); grid;          % Απόκριση φάσης
xlabel('Frequency (rad)'); ylabel('Phase (rad)');   % Ετικέτες
title('Phase Response');                            % Τίτλος
