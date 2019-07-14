dt = 0.01;                                   % Βήμα στο χρόνο
a = 2;                                       % Παράμετρος a
t = -1/2:dt:1/2;                             % Άξονας χρόνου
df = 0.01;                                   % Βήμα στη συχνότητα
f = -40:df:40;                               % Άξονας συχνότητας
x = [zeros(size(t(t<=0))) exp(a*t(t>0))];    % Σήμα
sigma = 4;                                   % Επιλογή s-άξονα
X = 1./(sigma - a + j*2*pi*f);               % Μετασχ. Laplace για σ=4
x_est = zeros(size(x));                      % Δέσμευση μνήμης
for i=1:length(f)                            % Βρόχος
x_est = x_est + X(i).*...                    % Εκτίμηση σήματος L^-1{X(s)}
exp((sigma + j*2*pi*f(i))*t);
end
x_est = df*x_est;                               % Κανονικοποίηση
plot(t, x); grid; hold on;                      % Γράφημα x(t)
plot(t, real(x_est), 'r'); hold off;            % Γράφημα xest(t)
xlabel('Time (s)'); ylabel('Ampliude');         % Ετικέτες
title('Signal and Inv. L.T.');                  % Τίτλος
legend('Original signal', 'Inverse LT signal'); % Επεξήγηση
