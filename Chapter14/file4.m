[x, fs] = audioread('myvoice.wav');             % Σήμα φωνής
num = [0.0181, 0.0543, 0.0543, 0.0181];         % Αριθμητής
den = [1, -1.76, 1.1829, -0.2781];              % Παρονομαστής
y = filter(num, den, x);                        % Φιλτράρισμα

t = 0:1/fs:length(x)/fs-1/fs;                   % Συνεχης άξονας χρόνου
subplot(211); plot(t, x); grid;                 % Γράφημα σήματος φωνής
xlabel('Time (s)'); ylabel('Amplitude');        % Ετικέτες
title('Input speech signal');                   % Τίτλος
subplot(212); plot(t, y); grid;                 % Έξοδος φίλτρου
xlabel('Time (s)'); ylabel('Amplitude');        % Ετικέτες
title('Output speech signal');                  % Τίτλος

soundsc(x, fs);                                 % Ακούστε το!
pause(5);
soundsc(y, fs);                                 % Ακούστε το!
