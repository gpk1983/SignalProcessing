N = 1000;                                      % Μήκος εξόδου
n = 0:N;                                       % Άξονας χρόνου
x = 0.8.^n;                                    % Σήμα εισόδου x[n]
h = (2/3)*(-1).^n + (1/3)*(1/2).^n;            % Κρουστική απόκριση h[n]
y = conv(h, x, 'full');                        % Έξοδος (συνέλιξη)
y = y(1:N+1);                                  % Κομμάτι που έχει νόημα
subplot(211); stem(n(1:20), x(1:20)); grid;    % Γράφημα εισόδου
title('Input signal x[n]');                    % Τίτλος
xlabel('Time (samples)'); ylabel('Amplitude'); % Ετικέτες
subplot(212); stem(n(1:20), y(1:20)); grid;    % Γράφημα εξόδου
title('Output signal y[n]');                   % Τίτλος
xlabel('Time (samples)'); ylabel('Amplitude'); % Ετικέτες
