H = tf([1 2], [1 7 12]);                        % Δημιουργία H(s)
[h,th] = impulse(H);                            % Κρουστική απόκριση h(t)
[s,ts] = step(H);                               % Βηματική απόκριση s(t)
subplot(131); plot(th, h);                      % Γράφημα h(t)
grid; xlabel('Time (s)');                       % Ετικέτες
ylabel('Amplitude'); title('Impulse Response'); % Ετικέτες
subplot(132); plot(ts, s);                      % Γράφημα s(t)
grid; xlabel('Time (s)');                       % Ετικέτες
ylabel('Amplitude'); title('Step Response');    % Ετικέτες
subplot(133); pzmap(H);                         % Διάγραμμα πόλων-μηδενικών
