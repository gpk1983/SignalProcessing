dt = 0.0001;                             % Βήμα στο χρόνο
t = 0:dt:0.5;                            % Άξονας χρόνου
m = 2*cos(2*pi*10*t);                    % Σήμα πληροφορίας m(t)
xc = cos(2*pi*200*t);                    % Φέρον σήμα xc(t)
x = m.*xc                                % Διαμορφωμένο σήμα x(t)
subplot(311); plot(t, m); grid;          % Γράφημα m(t)
xlabel('Time (s)'); ylabel('Amplitude'); % Ετικέτες
title('Signal m(t)');                    % Τίτλος
subplot(312); plot(t, xc); grid;         % Γράφημα xc(t)
xlabel('Time (s)'); ylabel('Amplitude'); % Ετικέτες
title('Signal xc(t)');                   % Τίτλος
subplot(313); plot(t, x); grid;          % Γράφημα x(t)
xlabel('Time (s)'); ylabel('Amplitude'); % Ετικέτες
title('DSB-SC signal x(t)');             % Τίτλος
df = 0.1;                                % Βήμα στη συχνότητα
f = -300:df:300;                         % Άξονας συχνοτήτων
ctft(x, t, f);                           % Μετασχ. Fourier
RC = 50;                                 % Παράμετρος φίλτρου
h = RC*exp(-RC*t);                       % Χαμηλοπερατό φίλτρο
ctft(h, t, f);                           % Μετασχ. Fourier
y = 2*x.*xc;                             % Πολλαπλασιασμός με xc(t)
ym = dt*conv(y, h, 'full');              % Φιλτράρισμα
ym = ym(1:length(t));                    % Διόρθωση μήκους
fm = -50:df:50;                          % Άξονας συχνοτήτων
ctft(ym, t, fm);                         % Μετασχ. Fourier
