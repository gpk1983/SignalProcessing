syms x y t tau;                 % Συμβολικές μεταβλητές
x(t) = exp(-2*t)*heaviside(t);  % Σήμα x(t)
y(t) = exp(-t)*heaviside(t);    % Σήμα y(t)
c(t) = int(x(tau)*y(t-tau), 'tau', -inf, +inf) % Συμβολική συνέλιξη
