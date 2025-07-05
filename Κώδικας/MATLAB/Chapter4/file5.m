syms y(t)                     % Συμβολική συνάρτηση
syms x(t)                     % Συμβολική συνάρτηση
x(t) = exp(-t);               % Είσοδος x(t)
dx = diff(x,t);               % Παράγωγος εισόδου x(t)
dy = diff(y,t);               % Παράγωγος εξόδου y(t)
yzs = dsolve(dy + 2*y == x(t) + 2*dx, y(0) == 0) % Εύρεση yzs(t)
