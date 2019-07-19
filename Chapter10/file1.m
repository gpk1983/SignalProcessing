f0 = 20;                           % Συχνότητα ημιτόνου
fs1 = 100; fs2 = 500; fs3 = 25;    % Συχνότητες δειγματοληψίας fsi
t1 = 0:1/fs1:.5;                   % Άξονας χρόνου με fs1
t2 = 0:1/fs2:.5;                   % Άξονας χρόνου με fs2
t3 = 0:1/fs3:.5;                   % Άξονας χρονου με fs3
x1 = cos(2*pi*f0*t1);              % Σήμα x1[n]
x2 = cos(2*pi*f0*t2);              % Σήμα x2[n]
x3 = cos(2*pi*f0*t3);              % Σήμα x3[n]
t = 0:0.00001:.5;                  % Προσομοίωση συνεχούς χρόνου
x = cos(2*pi*f0*t);                % Σήμα x(t)
subplot(311); stem(t1, x1);        % Γράφημα του x1[n]
hold on; xlabel('Time (s)');       % Ετικέτες
plot(t, x, 'r'); grid;             % Σήμα x(t)
title('fs = 100 Hz'); hold off;    % Τίτλος
subplot(312); stem(t2, x2);        % Γράφημα του x2[n]
hold on; xlabel('Time (s)');       % Ετικέτες
plot(t, x, 'r'); grid;             % Σήμα x(t)
title('fs = 500 Hz'); hold off;    % Τίτλος
subplot(313); stem(t3, x3);        % Γράφημα του x3[n]
hold on; xlabel('Time (s)');       % Ετικέτες
plot(t, x, 'r'); grid;             % Σήμα x(t)
title('fs = 25 Hz'); hold off;     % Τίτλος

xrec = zeros(size(t));                     % Δέσμευση μνήμης
for i=1:length(x3)                         % Βρόχος
     xrec = xrec + x3(i).*sinc(t*fs3-(i-1)); % Ανακατασκευή
end
figure; stem(t3, x3); grid;                % Γράφημα του x3[n]
title('Reconstructed signal');             % Τίτλος
xlabel('Time (s)'); hold on;               % Ετικέτες
plot(t, xrec, 'b'); axis([0 .5 -1.5 1.5]); % Σήμα xr(t)
