sympref('FourierParameters', [1, -2*sym(pi)]);       % Μεταβλητή συχνότητας f
syms t f tau;                                        % Συμβολικές μεταβλητές
x(t) = exp(-2*t)*heaviside(t);                       % Σήμα x(t)
h(t) = exp(-t)*heaviside(t);                         % Σήμα h(t)
y_t = int(x(tau)*h(t-tau), 'tau', -inf, inf);        % Συνέλιξη στο χρόνο
X = fourier(x, 'f');                                 % Μετασχ. Fourier X(f)
H = fourier(h, 'f');                                 % Μετασχ. Fourier H(f)
Y = H.*X;                                            % Μετασχ. Fourier Y(f)
y_f = ifourier(Y, 't');                              % Αντιστρ. Μετασχ. Fourier y(t)
subplot(311); ezplot(t, y_t); grid;                  % Γράφημα
ylabel('Amplitude');                                 % Ετικέτα
title('Convolution in time');                        % Τίτλος
subplot(312); ezplot(t, y_f); grid;                  % Γράφημα
ylabel('Amplitude');                                 % Ετικέτα
title('Inverse F.T. of product in frequency');       % Τίτλος
subplot(313); ezplot(t, abs(y_f-y_t)); grid;         % Γράφημα απολύτου σφάλματος
ylabel('Amplitude');                                 % Ετικέτα
title('Absolute Error Function');                    % Τίτλος
xlabel('Time (s)');                                  % Ετικέτα
