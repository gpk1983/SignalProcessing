ts = 0.01;                   % Βήμα στο χρόνο
tx = -5:ts:5;                % Άξονας χρόνου για το σήμα x(t)
x = cos(pi * tx/ 2);         % x(t)
th = -2:ts:2;                % Άξονας χρόνου για το σήμα h(t)
h = 2*rectpuls(th/2);        % h(t)
subplot(311); plot(tx, x);   % Γράφημα του x(t)
xlabel('Time (s)');          % Ετικέτα άξονα x
ylabel('Amplitude');         % Ετικέτα άξονα y
title('x(t)'); grid;         % Τίτλος
subplot(312); plot(th, h);   % Γράφημα του h(t)
xlabel('Time (s)');          % Ετικέτα άξονα x
ylabel('Amplitude');         % Ετικέτα άξονα y
title('h(t)'); grid;         % Τίτλος
ty = -7:Dt:7;                % Άξονας συνέλιξης (ιδιότητα εύρους)
y = Dt*conv(x,h);            % Συνέλιξη x(t) με h(t)
subplot(313); plot(ty, y);   % Γράφημα συνέλιξης
xlabel('Time (s)');          % Ετικέτα άξονα x
ylabel('Amplitude');         % Ετικέτα άξονα y
title('Convolution!'); grid; % Τίτλος
