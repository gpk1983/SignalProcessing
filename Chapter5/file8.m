Dt = 1/100;           % Βημα στο χρόνο
D = 10;               % Διάρκεια σήματος
t = 0:Dt:D;           % Άξονας χρόνου
Df = 0.01;            % Βήμα στη συχνότητα
f = -10:Df:10;        % Διάρκεια μετασχηματισμού
x = exp(-t);          % Σήμα x(t)
subplot(211); plot(t,x); grid;             % Γράφημα
xlabel('Time (s)'); ylabel('Amplitude');   % Ετικέτες
title('Signal x(t) = exp(-at)');           % Τίτλος
axis([0 t(end) 0 1.2]);                    % Μεγέθυνση
M = exp(-j*2*pi*f'*t);                     % Πίνακας ανάλυσης
X = Dt*x*M.';                              % Μετασχ. Fourier
Minv = exp(j*2*pi*f'*t);                   % Πίνακας σύνθεσης
xinv = Df*X*Minv;                          % Αντίστροφος Μετασχ. Fourier
subplot(212); plot(t, real(xinv));         % Γράφημα σήματος
xlabel('Time (s)'); ylabel('Amplitude');   % Ετικέτες
title('Inverse F.T. for x(t) = exp(-at)'); % Τίτλος
axis([0 t(end)/2 0 1.2]); grid;            % Μεγέθυνση
