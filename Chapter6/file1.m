Dt = 1/100;                                         % Βήμα στο χρόνο
D = 5;                                              % Διάρκεια σήματος
t = 0:Dt:D;                                         % Άξονας χρόνου
Df = 0.001;                                         % Βήμα στη συχνότητα
f = -10:Df:10;                                      % Διάρκεια μετασχηματισμού
x = exp(-2*t);                                      % Σήμα x(t)
h = exp(-t);                                        % Σήμα h(t)
M = exp(-j*2*pi*f'*t);                              % Πίνακας ανάλυσης
Minv = exp(j*2*pi*f'*t);                            % Πίνακας σύνθεσης
X = Dt*x*M.';                                       % Μετασχ. Fourier X(f)
H = Dt*h*M.';                                       % Μετασχ. Fourier H(f)
Y = H.*X;                                           % Μετασχ. Fourier Y(f)
y_f = real(Df*Y*Minv);                              % Αντίστρ. Μετασχ. Fourier y(t)
y_t = Dt*conv(x,h,'full');                          % Συνέλιξη στο χρόνο
y_t = y_t(1:length(t));                             % Διόρθωση μήκους
subplot(311); plot(t, y_t); grid;                   % Γράφημα
title('Convolution in time');                       % Τίτλος
ylabel('Amplitude');                                % Ετικέτα
subplot(312); plot(t, y_f); grid;                   % Γράφημα
ylabel('Amplitude');                                % Ετικέτα
title('Inverse F.T. of product in frequency');      % Τίτλος
subplot(313); plot(t, abs(y_f-y_t)); grid;          % Γράφημα απολύτου σφάλματος
ylabel('Amplitude');                                % Ετικέτα
title('Absolute Error Function');                   % Τίτλος
xlabel('Time (s)');                                 % Ετικέτα
