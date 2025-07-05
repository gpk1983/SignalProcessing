Dt = 1/100;                       % Βήμα στο χρόνο
D = 5;                            % Διάρκεια σήματος
t = 0:Dt:D;                       % Άξονας χρόνου
x = exp(-2*t);                    % Σήμα x(t)
y = exp(-t);                      % Σήμα y(t)
[phi, lags] = xcorr(y,x);         % Ετεροσυσχέτιση φxy(τ)
phi = Dt*phi;                     % Κανονικοποίηση
Df = 0.001;                       % Βήμα στη συχνότητα
f = [-10:Df:10];                  % Άξονας συχνότητας
M = exp(-j*2*pi*f'*t);            % Πίνακας ανάλυσης
X = Dt*x*M.';                     % Μετασχ. X(f)
Y = Dt*y*M.';                     % Μετασχ. Y (f)
Phi = conj(X).*Y;                 % Διαφασμ. Πυκν. Ενέργειας Φxy(f)
tp = -D:Dt:D;                     % Άξονας χρόνου
Minv = exp(j*2*pi*f'*tp);         % Πίνακας σύνθεσης
phi_iFT = Df*Phi*Minv;            % Ετεροσυσχέτιση μέσω Μετασχ. Fourier

figure; subplot(411); plot(t, x); grid;                     % Σήμα x(t)
title('x(t) = exp(-2t)u(t)'); ylabel('Amplitude');          % Ετικέτες
subplot(412); plot(t, y); grid;                             % Σήμα y(t)
title('y(t) = exp(-t)u(t)'); ylabel('Amplitude');           % Ετικέτες
subplot(413); plot(lags*Dt, phi); grid;                     % Σήμα φxy(τ)
title('Cross-correlation \phi_{xy}(t)'); grid;              % Ετικέτες
subplot(414); plot(tp, real(phi_iFT)); ylabel('Amplitude'); % F^-1{Φxy(f)}
title('Cross-correlation \phi_{xy}(t) via inverse F.T.');   % Τίτλος
xlabel('Time (s)'); ylabel('Amplitude');                    % Ετικέτες
