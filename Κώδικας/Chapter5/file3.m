t = 0:dt:2*T0;                    % Απεικονίζουμε 2 περιόδους
N = 40;                           % Θέλουμε 40 ημίτονα
X0 = 1/(a*T0)*(1 - exp(-a*T0/2)); % Συντελεστής X0
x = zeros(1, length(t));          % Δέσμευση μνήμης
for k = 1:N                       % Βρόχος επανάληψης
Xk = 1/(a*T0+j*2*pi*k)*...        % Συντελεστές Xk
(1-((-1)^k)*exp(-a*T0/2));
expsig = Xk*exp(j*2*pi*k/T0*t);   % Συναρτήσεις βάσης
x = x + expsig + conj(expsig);   % Σύνθεση σήματος
end
x = x + X0;                       % Προσθήκη X0
subplot(212); plot(t, x);         % Σειρά Fourier
grid; title('Fourier Series');    % Τίτλος
xlabel('Time (s)');               % Ετικέτα 
axis([0 t(end) -0.5 1.5]);        % Μεγέθυνση
hold off;
