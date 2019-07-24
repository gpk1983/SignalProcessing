N1 = 5;                        % Διάρκεια σήματος x1[n]
N2 = 30;                       % Διάρκεια σήματος x2[n]
x1 = ones(1, N1);              % Σήμα x1[n]
x2 = ones(1, N2);              % Σήμα x2[n]
NFFT = 2048;                   % Σημεία N
X1 = fft(x1, NFFT);            % FFT{x1[n]}
X2 = fft(x2, NFFT);            % FFT{x2[n]}

omega = 2*pi*(0:NFFT-1)./NFFT; % Άξονας ω
mag1 = abs(X1);                % |X1(e^j2πkN)|
ph1 = angle(X1);               % <X1(e^j2πkN)
mag2 = abs(X2);                % |X2(e^j2πkN)|
ph2 = angle(X2);               % <X2(e^j2πkN)

figure; subplot(211); plot(omega, mag1); grid;           % Γράφημα |X1(e^j2πkN)|
title('Magnitude Spectrum of X_1(e^{j2\pi k/N})');       % Τίτλος
ylabel('Magnitude'); xlabel('Frequency (\omega_k)');     % Ετικέτες
subplot(212); plot(omega, ph1); grid;                    % Γράφημα <X1(e^j2πkN)
title('Phase Spectrum of X_1(e^{j2\pi k/N})');           % Τίτλος
ylabel('Phase'); xlabel('Frequency (\omega_k)');         % Ετικέτες
figure; subplot(211); plot(omega, mag2); grid;           % Γράφημα |X2(e^j2πkN)|
title('Magnitude Spectrum of X_2(e^{j2\pi k/N})');       % Τίτλος
ylabel('Magnitude'); xlabel('Frequency (\omega_k)');     % Ετικέτες
subplot(212); plot(omega, ph2); grid;                    % Γράφημα <X2(e^j2πkN)
title('Phase Spectrum of X_2(e^{j2\pi k/N})');           % Τίτλος
ylabel('Phase'); xlabel('Frequency (\omega_k)');         % Ετικέτες
