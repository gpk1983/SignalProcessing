dt = 0.01;                % Βήμα στο χρόνο
T0 = 2;                   % Επιλέγουμε ένα Τ0
t = 0:dt:2*T0;            % Θέλουμε δυο περιόδους
N = 40;                   % Θέλουμε 40 ημίτονα
k = -N:N;                 % Τιμές του δείκτη k
a = 3;                    % Μεταβλητή a
Xk = 1./(a*T0+j*2*pi*k).*(1-((-1).^k)*exp(-a*T0/2)); % Συντελεστές Xk
absXk = abs(Xk);          % Πλάτος
angleXk = angle(Xk);      % Φάση
subplot(211); stem(k/T0, absXk); grid;     % Φάσμα πλάτους
title('Magnitude Spectrum');               % Τίτλος
xlabel('Frequency'); ylabel('Magnitude');  % Ετικέτες
subplot(212); stem(k/T0, angleXk); grid;   % Φάσμα φάσης
title('Phase Spectrum');                   % Τίτλος
xlabel('Frequency'); ylabel('Phase');      % Ετικέτες
