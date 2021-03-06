syms t s;                                              % Συμβολικές μεταβλητές
x1(t) = exp(-2*t)*heaviside(t);                        % Σήμα x1(t)
x2(t) = heaviside(t-2);                                % Σήμα x2(t)
x3(t) = exp(-t)*heaviside(t);                          % Σήμα x3(t)
x4(t) = exp(-3*t)*cos(2*pi*t)*heaviside(t);            % Σήμα x4(t)
x5(t) = dirac(t-2);                                    % Σήμα x5(t)
x6(t) = exp(-t)*heaviside(t) + exp(-3*t)*heaviside(t); % Σήμα x6(t)
X1 = laplace(x1);                                      % Μετασχ. X1(s)
X2 = laplace(x2);                                      % Μετασχ. X2(s)
X3 = laplace(x3);                                      % Μετασχ. X3(s)
X4 = laplace(x4);                                      % Μετασχ. X4(s)
X5 = laplace(x5);                                      % Μετασχ. X5(s)
X6 = laplace(x6);                                      % Μετασχ. X6(s)
