% Ορίζουμε τη μεταβλητή t
syms t;

% Ορίζουμε τη συνάρτηση
x = cos(2*pi*t + pi/3);

% Ζητάμε από τη συμβολική συνάρτηση int() να υπολογίσει για μας
% το ολοκλήρωμα
result = int(dirac(t)*x, -inf, inf)
