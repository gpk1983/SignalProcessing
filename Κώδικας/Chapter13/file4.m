No = 4;                                      % Παράμετρος σήματος
N = 15;                                      % Διάρκεια σήματος
NFFT = 512;                                  % N σημεία του DFT
x1 = 3 * cos(3*pi*(-7:7)/No););              % Σήμα x1[n]
fx1 = fft(x1, NFFT);                         % DFT
mag = abs(fx1);                              % Φάσμα πλάτους
ph = angle(fx1);                             % Φάσμα φάσης
omega = 2*pi*(0:NFFT-1)./NFFT;               % Άξονας ω

figure; subplot(311); stem(-7:7, x1); grid;        % Γράφημα x1[n]
xlabel('Time (samples)'); ylabel('Amplitude');     % Ετικέτες
title('Signal in time');                           % Τίτλος
subplot(312); plot(omega, mag); grid;              % Γράφημα πλάτους
ylabel('Magnitude'); xlabel('Frequency (\omega)'); % Ετικέτες
title('Magnitude Spectrum');                       % Τίτλος
subplot(313); plot(omega, ph); grid;               % Γράφημα φάσης
ylabel('Phase'); xlabel('Frequency (\omega)');     % Ετικέτες
title('Phase Spectrum');                           % Τίτλος
