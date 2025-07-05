t2 = -6:ts:-4;                       % Άξονας [-6, -4]
x2 = (4/pi)*(cos(pi*t2/2) + 1);      % Σήμα στον παραπάνω άξονα
t3 = -4:ts:4;                        % Άξονας [-4, 4]
x3 = (8/pi)*(cos(pi*t3/2));          % Σήμα στον παραπάνω άξονα
t4 = 4:ts:6;                         % Άξονας [4, 6]
x4 = (4/pi)*(cos(pi*t4/2) + 1);      % Σήμα στον παραπάνω άξονα
t_zero1 = -7:ts:-6;                  % Άξονας [-7, -6]
x_zero1 = zeros(1, length(t_zero1)); % Σήμα στον παραπάνω άξονα
t_zero2 = 6:ts:7;                    % Άξονας [6, 7]
x_zero2 = zeros(1, length(t_zero2)); % Σήμα στον παραπάνω άξονα
plot(t2, x2, t3, x3, t4, x4, ...     % Γράφημα
t_zero1, x_zero1, t_zero2, x_zero2);
xlabel('Time (s)');                  % Ετικέτα
ylabel('Amplitude');                 % Ετικέτα
title('Convolution by hand');        % Τίτλος
legend('Case2', 'Case3', 'Case4',... % Επεξήγηση
'Zero Case1', 'Zero Case5');
