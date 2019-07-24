[s,fs] = audioread('speechSysHz.wav');                        % Φόρτωση αρχείου
soundsc(s, fs);                                               % Ακούστε το!

num_min1 = [1, -0.8*exp(j*pi/4)];                             % Όρος αριθμητή
num_min2 = [1, -0.8*exp(-j*pi/4)];                            % Όρος αριθμητή
den_min1 = [1, -0.97*exp(j*3*pi/4)];                          % Όρος παρονομαστή
den_min2 = [1, -0.97*exp(-j*3*pi/4)];                         % Ορος παρονομαστή

num = conv(num_min1, num_min2);                               % Αριθμητής
den = conv(den_min1, den_min2);                               % Παρονομαστής
sf = filter(dmin, nmin, s);                                   % Φιλτράρισμα

figure; subplot(211); plot(0:1/fs:length(s)/fs-1/fs, s);      % Γράφημα s[n]
title('Original signal'); xlabel('Time (s)');                 % Ετικέτες
figure; subplot(212); plot(0:1/fs:length(sf)/fs-1/fs, sf);    % Γράφημα sf[n]
title('Filtered signal'); xlabel('Time (s)');                 % Ετικέτες
soundsc(sf, fs);                                              % Ακούστε το!
