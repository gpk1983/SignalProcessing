N = 1000;                                                  % Μήκος εξόδου
n = 0:N;                                                   % Άξονας χρόνου
x = 0.8.^n;                                                % Σήμα εισόδου
system_num = 1;                                            % Συντελεστές εισόδου
system_den = [1 1/2 -1/2];                                 % Συντελεστές εξόδου
y_in = [-1; 1];                                            % Αρχικές συνθήκες
y_tot = filter(system_num, system_den, x, y_in);           % Συνολική έξοδος
y = filter(system_num, system_den, x);                     % yΓΧΑ[n]
dd = [1; zeros(N+1, 1)];                                   % δ[n]
h = filter(system_num, system_den, dd);                    % h[n]
yzi = filter(system_num, system_den, zeros(1, N+1), y_in); % yzi[n]
yzs = filter(system_num, system_den, x);                   % yzs[n]
