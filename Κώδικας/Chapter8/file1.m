syms t s;                                         % Συμβολικές μεταβλητές
H(s) = 1/(s^2 + 5*s + 6);                         % Σύστημα H(s)
X(s) = laplace(20*exp(-t).*sin(t));               % Είσοδος X(s)
Y(s) = H(s)*X(s);                                 % Έξοδος Y(s)
y(t) = simplify(ilaplace(Y(s)));                  % Έξοδος y(t)
fplot(y(t), [0 10]);                              % Γράφημα y(t)
hold on; grid;                                    % Κράτηση γραφήματος
fplot(ilaplace(X(s)), [0 10]);                    % Γράφημα x(t)
legend('Output', 'Intput');                       % Επεξήγηση
title('y^{(2)}(t) + 5y^{(1)}(t) + 6y(t) = x(t)'); % Τίτλος
xlabel('Time (s)');                               % Ετικέτα
