a = 2;                                                  % Παράμετρος a
n = -5:10;                                              % Άξονας χρόνου
dw = 2*pi/600;                                          % Βήμα στη συχνότητα
w = -pi+dw:dw:pi;                                       % Άξονας συχνότητας
x = [zeros(size(n(n<0))) a.^n((n>=0))];                 % Σήμα

z_0 = 4;                                                % Επιλογή κύκλου |z| = 4
X = 1./(1 - a*(z_0.^(-1)).*(exp(-j*w)));                % Μετασχ. Ζ για |z| = 4
x_est = (1/(2*pi))*X*(z_0*exp(j*w')).^(n)*dw;           % Z^-1{x[n]}

stem(n, x); grid; hold on;                              % Γράφημα του x[n]
stem(n, real(x_est), 'r'); hold off;                    % Γράφημα του xest[n]
xlabel('Time (samples)'); ylabel('Ampliude')            % Ετικέτες
title('Signal and Inv. Z.T.');                          % Τίτλος
legend('Original signal', 'Inverse ZT signal');         % Επεξήγηση
