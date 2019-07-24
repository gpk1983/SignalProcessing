n = 0:100;                                       % Άξονας χρόνου
dw = 2*pi/600;                                   % Βήμα στη συχνότητα
omega = -pi+dw:dw:pi;                            % Άξονας συχνότητας
x = (1/2).^n;                                    % Σήμα x[n]
h = (-1/3).^n;                                   % Σήμα h[n]

M = exp(-j*omega'*n);                            % Πίνακας ανάλυσης
Minv = exp(j*omega'*n);                          % Πίνακας σύνθεσης

X = x*M.';                                       % Μετασχ. Fourier X(e^jω)
H = h*M.';                                       % Μετασχ. Fourier H(e^jω)
Y = H.*X;                                        % Μετασχ. Fourier Y(e^jω)

y_f = (1/(2*pi))*real(dw*Y*Minv);                % Αντιστρ. Μετασχ. Fourier y[n]
y_n = conv(x,h,'full');                          % Συνέλιξη στο χρόνο
y_n = y_t(1:length(n));                          % Διόρθωση μήκους

subplot(311); stem(n, y_n); grid;                % Γράφημα
title('Convolution in time');                    % Τίτλος
ylabel('Amplitude');                             % Ετικέτα
subplot(312); stem(n, y_f); grid;                % Γράφημα
ylabel('Amplitude');                             % Ετικέτα
title('Inverse F.T. of product in frequency');   % Τίτλος
subplot(313); stem(n, abs(y_f-y_n)); grid;       % Γράφημα απόλυτου σφάλματος
ylabel('Amplitude');                             % Ετικέτα
title('Absolute Error Function');                % Τίτλος
xlabel('Time (samples)');                        % Ετικέτα
