syms y(t)                                     % Συμβολική συνάρτηση
yzi = dsolve(diff(y,t) + 2*y == 0, y(0) == 2) % Εύρεση yzi(t)
