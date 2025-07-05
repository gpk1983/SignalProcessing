Dt = 1/100;                                    % Βήμα στο χρόνο
D = 10;                                        % Διάρκεια σήματος
t = 0:Dt:D;                                    % Άξονας χρόνου
Df = 0.01;                                     % Βήμα στη συχνότητα
f = -10:Df:10;                                 % Διάρκεια σήματος
M = exp(-j*2*pi*f'*t);                         % Πίνακας ανάλυσης
a=1;                                           % Μεταβλητή a
x = exp(-a*t);                                 % Ορισμός σήματος
subplot(3,1,1); plot(t,x); grid;               % Γράφημα
xlabel('Time (s)');                            % Ετικέτα
title('Signal x(t) = exp(-at)');               % Τίτλος
X = Dt*x*M.';                                  % Μετασχ. Fourier
Xth = 1./(a + j*2*pi*f);                       % Θεωρητικό αποτέλεσμα
subplot(3,1,2); plot(f, abs(X)); grid;         % Φάσμα πλάτους
hold on; plot(f, abs(Xth), 'r--');             % Θεωρητικό φάσμα πλάτους
legend('MATLAB approximation', 'Theory');      % Επεξήγηση
xlabel('Frequency (Hz)'); ylabel('Magnitude'); % Ετικέτες
title('Magnitude Spectrum');                   % Τίτλος
xlabel('Frequency (Hz)'); hold off;            % Ετικέτα άξονα x
subplot(3,1,3); plot(f, angle(X)); grid;       % Φάσμα φάσης
hold on; plot(f, angle(Xth), 'r--');           % Θεωρητικό φάσμα φάσης
legend('MATLAB approximation', 'Theory');      % Επεξήγηση
xlabel('Frequency (Hz)'); ylabel('Phase');     % Ετικέτες
title('Phase Spectrum');                       % Τίτλος
xlabel('Frequency (Hz)'); hold off;            % Ετικέτα άξονα x
