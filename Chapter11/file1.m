n = -10:10;                                % Άξονας χρόνου
w0 = pi/6;                                 % Συχνότητα
x1 = 2*sin(w0*n);                          % Ημιτονοειδές σήμα x1[n]
x2 = [zeros(1,10) 1 zeros(1,10)];          % Συνάρτηση Δέλτα x2[n]
oldparam = sympref('HeavisideAtOrigin',1); % Σωστή βηματική
x3 = heaviside(n);                         % Βηματική συνάρτηση x3[n]
x4 = (0.5).^n;                             % Εκθετικό σήμα x4[n] = (0.5)^n
x5 = (-0.9).^n;                            % Εκθετικό σήμα x5[n] = (-0.9)^n
w1 = 2*pi/3;                               % Συχνότητα
x6 = ((-0.8).^n).*cos(w1*n);               % Φθίνον εκθετικό σήμα x6[n]
subplot(3,2,1); stem(n, x1); grid;         % Γράφημα x1[n]
title('2sin(\omega_0n)');                  % Τίτλος
subplot(3,2,2); stem(n, x2); grid;         % Γράφημα x2[n]
title('\delta[n]');                        % Τίτλος
subplot(3,2,3); stem(n, x3); grid;         % Γράφημα x3[n]
title('u[n]');                             % Τίτλος
subplot(3,2,4); stem(n, x4); grid;         % Γράφημα x4[n]
title('(0.5)^n');                          % Τίτλος
subplot(3,2,5); stem(n, x5); grid;         % Γράφημα x5[n]
title('(-0.9)^n');                         % Τίτλος
subplot(3,2,6); stem(n, x6); grid;         % Γράφημα x6[n]
title('(-0.3)^n cos(\omega_0n)');          % Τίτλος
