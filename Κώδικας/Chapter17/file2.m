[s, fs] = audioread('myvoice.wav');          % Φόρτωση σήματος

middle = round(length(s)/2);                 % Μέσον σήματος
T = round(40*10^(-3)*fs);                    % 40 ms σε δείγματα
seg = s(middle:(middle + T));                % Τμήμα σήματος
plot(middle:(middle + T), seg); grid;        % Γράφημα τμήματος σήματος
xlabel('Samples'); title('Speech signal');   % Ετικέτες

[r,l] = xcorr(seg, seg);                             % Αυτοσυσχέτιση
plot(l, r); grid;                                    % Γράφημα
xlabel('Samples'); title('r_x[m] of speech signal'); % Ετικέτες
