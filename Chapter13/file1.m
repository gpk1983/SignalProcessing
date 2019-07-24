A = 2;                                        % Πλάτος
N0 = 12;                                      % Περίδος
M = 3;                                        % Διάρκεια παλμού (2Μ+1)
w0 = 2*pi/N0;                                 % Θεμελιώδης συχνότητα
k = 1:N0-1;                                   % Δείκτης συντελεστών
D0 = A*(2*M+1)/N0;                            % D0
Dk = A/N0 * sin(k*w0*(2*M+1)/2)./sin(k*w0/2); % Dk
n = -20:20;                                   % Άξονας χρόνου
x = zeros(size(n));                           % Αρχικοποίηση x[n]
for i = 1:length(k)                           % Βρόχος
x = x + Dk(i)*exp(j*k(i)*w0*n);               % Σειρά Fourier
end
x = D0 + x;                                   % Προσθήκη D0
figure; stem(n, real(x)); grid;               % Γράφημα του x[n]
title('Discrete Time Fourier Series');        % Τίτλος
xlabel('Time (samples)');                     % Ετικέτες
