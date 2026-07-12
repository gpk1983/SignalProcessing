import sys
import math as m
import numpy as np

"""s = rosenmodel(N1,N2,f0,fs)

Δεδομένων των N1 και N2, αυτή η συνάρτηση υπολογίζει το μοντέλο
Rosenberg της γλωττιδικής κυματομορφής για τη δημιουργία σημάτων ομιλίας.
Το f0 δίνεται για να ελεγχθεί αν το N1+N2 "χωράει" σε μία περίοδο τόνου.
Στο τέλος του σήματος προστίθενται N2 μηδενικά για να συμπεριληφθεί
η κλειστή φάση της γλωττίδας.

Ex: s = rosenmodel(80,10,100);"""


def rosenmodel(*args, **kwargs):
    if len(args) < 4:
        fs = 8000

    N0 = round(fs / args[2])
    
    if N0 < (args[0] + args[1]):
        sys.exit("Επιλέξτε N1 και N2 έτσι ώστε N1+N2 να είναι μικρότερο από fs/f0!")

    n1 = [i for i in range(0, args[0] + 1)]
    
    n2 = [i for i in range(args[0], args[0] + args[1] + 1)]
    
    s = [0.5 * (1 - np.cos(np.pi * i / args[0])) for i in n1]
    
    s = np.hstack([s, [np.cos(np.multiply(np.pi, np.array((i - args[0])/(2 * args[1])))) for i in n2]])
    N_cp = N0 - len(s) 
    s = np.hstack([s.reshape(1, len(s)), np.zeros((1, N_cp))])

    return s
