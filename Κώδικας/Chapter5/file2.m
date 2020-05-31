dt = 0.001;                         % Βήμα στο χρόνο
T0 = 2;                             % Επιλέγουμε μια περίοδο
a = 3;                              % Μεταβλητή a
subplot(211);
t1 = 0:dt:T0/2;                     % Άξονας χρόνου
t2 = T0/2+dt:dt:T0;                 % Άξονας χρόνου
plot(t1, exp(-a*t1), 'r');          % Γράφημα
hold on;
plot(t2, zeros(1,length(t2)), 'r'); % Γράφημα
axis([0 t(end) -.5 1.5]);           % Μεγέθυνση
title('Original Signal');           % Τίτλος
grid; hold off; 
