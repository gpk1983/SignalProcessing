syms t;                                        % Συμβολική μεταβλητή
sympref('FourierParameters', [1, -2*sym(pi)]); % Μεταβλητή συχνότητας f
x1(t) = dirac(t);                              % Σήμα x1(t)
x2(t) = heaviside(t-2);                        % Σήμα x2(t)
x3(t) = rectangularPulse(t);                   % Σήμα x3(t)
x4(t) = (exp(-2*t) - exp(-4*t))*heaviside(t);  % Σήμα x4(t)
x5(t) = 2*cos(2*pi*400*t);                     % Σήμα x5(t)
X1 = fourier(x1, 'f')                          % Σήμα X1(f)
X2 = simplify(fourier(x2, 'f'))                % Σήμα X2(f)
X3 = simplify(fourier(x3, 'f'))                % Σήμα X3(f)
X4 = fourier(x4, 'f')                          % Σήμα X4(f)
X5 = simplify(fourier(x5, 'f'))                % Σήμα X5(f)
