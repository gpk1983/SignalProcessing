% h[n] = δ[n-nd]
num1 = [zeros(1,10) 1];               % Αριθμητής
den1 = 1;                             % Παρονομαστής
subplot(221); grpdelay(num1, den1);   % Καθυστέρηση ομάδας
title('Group Delay');                 % Τίτλος
subplot(222); phasedelay(num1 ,den1); % Καθυστέρηση φάσης
title('Phase Delay');                 % Τίτλος

% h[n] = (0.8)^n u[n]
num2 = 1;                             % Αριθμητής
den2 = [1, -0.8];                     % Παρονομαστής
subplot(223); grpdelay(num2, den2);   % Καθυστέρηση ομάδας
title('Group Delay');                 % Τίτλος
subplot(224); phasedelay(num2 ,den2); % Καθυστέρηση φάσης
title('Phase Delay');                 % Τίτλος
