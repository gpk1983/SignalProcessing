Dt = 1/100;                              % Βήμα στο χρόνο
D = 5;                                   % Διάρκεια σήματος
t = -D:Dt:D;                             % Άξονας χρόνου
Df = 0.001;                              % Βήμα στη συχνότητα
f = -10:Df:10;                           % Διάρκεια μετασχηματισμού
x = sign(t);                             % Σήμα x(t)
subplot(311); plot(t,x); grid;           % Γράφημα
xlabel('Time (s)'); ylabel('Amplitude'); % Ετικέτες
title('Signal x(t) = sign(t)');          % Τίτλος
axis([t(1) t(end) -1.1 1.1]);            % Μεγέθυνση
X = 1./(j*pi*f);                         % Μετασχ. Fourier
X(isinf(X)) = 0;                         % Διόρθωση άπειρης τιμής
Minv = exp(j*2*pi*f'*t);                 % Πίνακας σύνθεσης
xinv = Df*X*Minv;                        % Αντίστροφος Μετασχ. Fourier
subplot(312); plot(t, real(xinv)); grid; % Γράφημα
xlabel('Time (s)'); ylabel('Amplitude'); % Ετικέτες
title('Inverse Fourier Transform x(t)'); % Τίτλος
axis([t(1) t(end) -1.1 1.1]);            % Μεγέθυνση
err = abs(x - real(xinv));               % Συνάρτηση σφάλματος
subplot(313); plot(t, err);              % Γράφημα
xlabel('Time (s)'); ylabel('Amplitude'); % Ετικέτες
title('Absolute Error function'); grid;  % Τίτλος
E = Dt*sum(err.^2);                      % Ενέργεια σφάλματος
