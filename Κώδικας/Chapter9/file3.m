syms f real                                    % Συμβολικές μεταβλητές
sympref('FourierParameters', [1, -2*sym(pi)]); % Συχνότητες ως προς f
X(f) = fourier(x(t), 'f');                     % Σήμα X(f)
Y(f) = fourier(y(t), 'f');                     % Σήμα Y(f)
Phi(f) = conj(X(f))*Y(f);                      % Διαφ. Πυκνότ. Ενέργειας Φxy(f)
phi(tau) = rewrite(simplify ...                % F^-1{Φxy(f)}
           (ifourier(Phi(f), 'tau')), 'heaviside');
