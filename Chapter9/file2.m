 syms t tau                                   % Συμβολικές μεταβλητές
x(t) = exp(-2*t)*heaviside(t);                % Σήμα x(t)
y(t) = heaviside(t);                          % Σήμα y(t)
phi(tau) = int(x(t)*y(t+tau), 't', -inf, inf) % Ετεροσυσχέτιση
