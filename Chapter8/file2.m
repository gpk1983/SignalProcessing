syms t s y(t) Y x(t) X(s);                                          % Συμβολικές μεταβλητές
y0 = 4;                                                             % Αρχική συνθήκη
Dy0 = 5;                                                            % Αρχική συνθήκη
x(t) = exp(-t)*heaviside(t);                                        % Είσοδος x(t)
X(s) = laplace(x(t));                                               % Είσοδος X(s)
dY = s*Y - y0;                                                      % Όρος sY(s)-y(0)
ddY = s*dY - Dy0;                                                   % Όρος s(sY(s)-y(0))-y'(0)
Eq = ddY + 3*dY + 2*Y - X(s);                                       % Εξίσωση
Sol = solve(Eq, Y);                                                 % Λύση
y(t) = ilaplace(Sol);                                               % Έξοδος y(t)
fplot(y(t), [0 10]);                                                % Γράφημα y(t)
hold on; grid;                                                      % Επικάλυψη γραφημάτων
fplot(x(t), [0 10]);                                                % Γράφημα x(t)
legend('Output', 'Intput');                                         % Επεξήγηση
title('y^{(2)}(t) + 3y^{(1)}(t) + 2y(t) = x(t), y(0)=4, dy(0)=5');  % Τίτλος
xlabel('Time (s)');                                                 % Ετικέτα
