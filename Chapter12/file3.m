N = 1000;                                       % Μήκος εξόδου
n = 0:N;                                        % Αξονας χρόνου
y_in = [0; 0];                                  % Αρχικές συνθήκες
x = 0.8.^n;                                     % Σήμα εισόδου x[n]
y = [y_in; zeros(N+1,1)];                       % Αρχικοποίηση εξόδου y[n]
for i = 3:N+1                                   % Βρόχος επανάληψης
    y(i) = 0.5*y(i-1) - 0.25*y(i-2) + x(i-2);   % Εξίσωση διαφορών
end
subplot(211); stem(n(1:20), x(1:20)); grid;     % Γράφημα εισόδου
title('Input signal x[n]');                     % Τίτλος
xlabel('Time (samples)'); ylabel('Amplitude');  % Ετικέτες
new_n = -2:N;                                   % Άξονας χρόνου εξόδου
subplot(212); stem(new_n(1:22), y(1:22)); grid; % Γράφημα εξόδου
title('Zero state response y_{zs}[n]');         % Τίτλος
xlabel('Time (samples)'); ylabel('Amplitude');  % Ετικέτες
