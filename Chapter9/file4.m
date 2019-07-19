T0 = 10^(-5);                                      % Διάρκεια σήματος
Dt = 10^(-8);                                      % Βήμα στο χρόνο
t = 0:Dt:7*T0;                                     % Άξονας χρόνου
b = 5*10^(-5);                                     % Σταθερά β
fc = 10^6;                                         % Συχνότητα fc
a = 0.3;                                           % Πλάτος καθυστέρησης a
tsin = 0:Dt:T0;                                    % Άξονας
tzero = T0+Dt:Dt:7*T0;                             % Άξονας
x = [sin(2*pi*fc*tsin) zeros(1,length(tzero))];    % Σήμα x(t)
r = [zeros(1, length([0:Dt:b-Dt])) a*sin(2*pi*fc*tsin) ... % Σήμα r(t)
... zeros(1,length([b+T0+Dt:Dt:7*T0]))];
figure; plot(t,x); hold on; plot(t, r); grid;      % Γραφήματα x(t), r(t)
xlabel('Time (s)'); ylabel('Amplitude');           % Ετικέτες
title('Transmitted and Received Pulse');           % Τίτλος
legend('Transmitted', 'Received');                 % Επεξήγηση
n = 0 + 0.5*randn(size(x));                        % Δημιουργία θορύβου n(t)
rn = r + n;                                        % Προσθήκη θορύβου
figure; plot(t, rn);                               % Γράφημα r(t) + n(t)
title('Received Pulse + Noise'); grid;             % Τίτλος
xlabel('Time (s)'); ylabel('Amplitude');           % Ετικέτες
matched = fliplr(x);                               % Matched filter
figure; subplot(211); plot(-fliplr(t), matched);   % Γράφημα
xlabel('Time (s)'); ylabel('Amplitude');           % Ετικέτες
title('Matched filter'); grid;                     % Τίτλος
y = Dt*conv(rn, matched, 'full');                  % Συνέλιξη
tc = -7*T0:Dt:7*T0;                                % Άξονας χρόνου συνέλιξης
subplot(212); plot(tc, y); grid;                   % Γράφημα
xlabel('Time (s)'); ylabel('Amplitude');           % Ετικέτες
title('Output of matched filter');                 % Τίτλος
