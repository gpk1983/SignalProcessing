dw = 2*pi/600;                                           % Βήμα στη συχνότητα
omega = -pi+dw:dw:pi;                                    % Άξονας συχνοτήτων
n = 0:100;                                               % Άξονας χρόνου
a = 1/2;                                                 % Παράμετρος σήματος
x = a.^n;                                                % Σήμα x[n]
stem(n, x); grid; title('Signal in time');               % Γράφημα x[n]
xlabel('Time (samples)');                                % Ετικέτα
X_FT_th = 1./(1 - a.*exp(-1i*omega));                    % X(e^jω)
X_FT = x*exp(-j*omega'*n).';                             % F{x[n]}
x_est = (1/(2*pi))*X_FT_th*exp(j*omega'*n)*dw;           % Σήμα F^-1{X(e^jω)}

subplot(211); plot(omega, abs(X_FT_th)); hold on;        % Γράφημα |X(e^jω)|
plot(omega, abs(X_FT), 'r'); grid;                       % Γράφημα του F{x[n]}
title('Magnitude comparison'); ylabel('Magnitude');      % Ετικέτες
legend('Theoretical', 'Fourier Summation');              % Επεξήγηση
plot(omega, angle(X_FT), 'r'); grid; ylabel('Phase');    % Γράφημα <X(e^jω)
title('Phase comparison'); xlabel('Frequency (\omega)'); % Ετικέτες
legend('Theoretical', 'Fourier Summation'); hold off;    % Επεξήγηση

figure; subplot(311); stem(n(1:20), x(1:20)); grid;      % Γράφημα x[n]
title('Signal x[n]'); ylabel('Amplitude');               % Ετικέτες
subplot(312); stem(n(1:20), real(x_est(1:20)));          % Γράφημα F^-1{X(e^jω)}
title('Signal x[n] via Inverse F.T.');                   % Τίτλος
ylabel('Amplitude'); grid;                               % Ετικέτες
subplot(313); stem(n, abs(real(x_est - x)));             % Απόλυτο σφάλμα
xlabel('Time (samples)'); ylabel('Amplitude'); grid;     % Ετικέτες
title('Absolute Error Function');                        % Τίτλος
