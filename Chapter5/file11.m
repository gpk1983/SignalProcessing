syms t;                                        % Συμβολική μεταβλητή
sympref('FourierParameters', [1, -2*sym(pi)]); % Μεταβλητή συχνότητας f
x1i = fourier(X1, 't')                         % Αντίστ. M.F. x1(t)
x2i = simplify(fourier(X2, 't'))               % Αντίστ. M.F. x2(t)
x3i = simplify(fourier(X3, 't'))               % Αντίστ. M.F. x3(t)
x4i = simplify(fourier(X4, 't'))               % Αντίστ. M.F. x4(t)
x5i = simplify(fourier(X5, 't'))               % Αντίστ. M.F. x5(t)
