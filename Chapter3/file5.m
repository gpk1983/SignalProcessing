% Ορίζουμε τη μεταβλητή t
syms t;

% Εκθετικό σήμα exp(-t)
x1(t) = exp(-t);
subplot(321); fplot(x1, [-2, 5]); grid;

% Εκθετική συνάρτηση exp(-t)u(t)
x2(t) = exp(-t)*heaviside(t);
subplot(322); fplot(x2, [-2, 5]); grid;

% Τετραγωνικός παλμός
x3(t) = heaviside(t)-heaviside(t-2);
subplot(323); fplot(x3, [-2, 5]); grid;

% Ημιτονοειδές
x4(t) = 2*cos(2*pi*10*t - pi/3);
subplot(324); fplot(x4, [-1/2, 1/2]); grid;

% Βηματική συνάρτηση u(-t)
x5(t) = heaviside(-t);
subplot(325); fplot(x5, [-5, 5]); grid;
xlabel('Time (s)');

% Τριγωνικός παλμός
x6a(t) = (t+2)*(heaviside(-t) - heaviside(-t-2));
x6b(t) = (-t+2)*(heaviside(t) - heaviside(t-2));
x6 = x6a + x6b;
subplot(326); fplot(x6, [-5, 5]); grid;
xlabel('Time (s)');
