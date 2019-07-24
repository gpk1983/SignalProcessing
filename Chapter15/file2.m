syms n z;                           % Συμβολικές μεταβλητές

x1 = 2^n;                           % Σήμα x1[n]
x2 = 1;                             % Σήμα x2[n]
x3 = (1/2)^n;                       % Σήμα x3[n]
x4 = (1/2)^n*cos(pi*n/3);           % Σήμα x4[n]
x5 = (1/3)^n + (1/4)^n;             % Σήμα x5[n]
x6 = n;                             % Σήμα x6[n]

X1 = ztrans(x1, z);                 % Μετασχ. X1(z)
X2 = ztrans(x2, z);                 % Μετασχ. X2(z)
X3 = ztrans(x3, z);                 % Μετασχ. X3(z)
X4 = ztrans(x4, z);                 % Μετασχ. X4(z)
X5 = ztrans(x5, z);                 % Μετασχ. X5(z)
X6 = ztrans(x6, z);                 % Μετασχ. X6(z)
