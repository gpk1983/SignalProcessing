% Ορίζουμε τον άξονα του χρόνου από 2+ (λόγω της βηματικής συνάρτησης)
% ως μια μεγάλη τιμή (π.χ. 1000) τμηματοποιώντας ανά Dt = 0.0001
Dt = 0.0001;
t = 2+Dt:Dt:1000;

% Η συνάρτηση x(t) ορίζεται ως εξής:
x = (1/3)*exp(-2*(t-2));

% Υψώνουμε στο  τετράγωνο
x_sq = x.^2;

% Υπολογίζουμε το ολοκλήρωμα Riemann
result = Dt*sum(x_sq);

% Επιβεβαίωση
1/36