n = 0:30;                                          % Άξονας χρόνου
x = (1/2).^n;                                      % Σήμα x[n]
[rx, l] = xcorr(x,x);                              % Αυτοσυσχέτιση
y = (1/4).^n;                                      % Σήμα y[n]

[rxy, lxy] = xcorr(y,x);                           % Ετεροσυσχέτιση rxy[m]
[ryx, lyx] = xcorr(x,y);                           % Ετεροσυσχέτιση ryx[m]

figure; subplot(211); stem(n, x); grid;            % Γράφημα x[n]
xlabel('Samples'); title('Signal (1/2)^n u[n]');   % Ετικέτες
subplot(212); stem(l, rx); grid;                   % Γράφημα rx[m]
xlabel('Samples'); title('Autocorrelation');       % Ετικέτες

figure; subplot(411); stem(n, x); grid;            % Γράφημα x[n]
xlabel('Samples'); title('Signal x[n]');           % Ετικέτες
subplot(412); stem(n, y); grid;                    % Γράφημα y[n]
xlabel('Samples'); title('Signal y[n]');           % Ετικέτες
subplot(413); stem(lxy, rxy); grid;                % rxy[m]
xlabel('Samples'); title('r_xy[m]');               % Ετικέτες
subplot(414); stem(lyx, ryx); grid;                % ryx[m]
xlabel('Samples'); title('r_yx[m]');               % Ετικέτες
