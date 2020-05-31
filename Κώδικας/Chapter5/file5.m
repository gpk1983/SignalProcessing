dt = 0.0001;                   % Βήμα στο χρόνο
T0 = 1;                        % Επιλέγουμε μια τιμή περιόδου
t = 0:dt:4*T0;                 % Θέλουμε 4 περιόδους
N = 40;                        % Θέλουμε 40 ημίτονα
k = [-N:-1 1:N];               % Τιμές του δείκτη k
X0 = 1;                        % Συντελεστής X0
Xk = 1./(k*pi)*exp(j*pi/2);    % Συντελεστές Xk
x = X0 + Xk*exp(j*2*pi*k'/T0*t); % Σειρά Fourier
plot(t, real(x)); grid;          % Γράφημα
title('Fourier Series from Exponential Coefficients'); % Τίτλος
xlabel('Time (s)');              % Ετικέτα
