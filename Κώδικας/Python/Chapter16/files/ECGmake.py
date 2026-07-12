import numpy as np
import math as m
import scipy.io as io
import scipy.signal as sig
import sys


# ecgsig = διανυσμα των δειγμάτων του σήματος σε fs δείγματα/δευτερόλεπτο
# fint = συχνότητα παρεμβολής σε Hz
# rnstring = 4-ψήφιος αριθμός : e.g., ’1367’ or ’3646’

def ECGmake(rnstring):
    if (len(rnstring) > 4):
        sys.exit("Ο αριθμός σας είναι μεγαλύτερος από 4 ψηφία! Παρακαλώ εισάγετε έναν αριθμό 4 ψηφίων.")
        
    x = int(rnstring)

    if not x:
        sys.exit("Ο αριθμός σας είναι μη έγκυρος! Παρακαλώ εισάγετε έναν αριθμό 4 ψηφίων.")

    y = x*(10**(-3))

    f0 = 50
    w0 = ((round(f0*y*100)/100) + np.random.rand(1, 1)) / (((round(y)*100)/100) - 0.5*np.random.rand(1, 1))

    # Φόρτωση του αρχείου ECG.mat και επαναδειγματοληψία του σήματος σε 8000 Hz
    m = io.loadmat('./files/ECG.mat')
    ecgsig = sig.resample(m['fileECG'], int(len(m['fileECG']) * 8000 / m['fs'][0]))
    fs = 8000
    ecgsig = ecgsig[0:len(ecgsig)-500]
    ecgsig = ecgsig/max(abs(ecgsig))
    ecgsig = ecgsig - np.mean(ecgsig)

    # Προσθήκη παρεμβολής
    ecgsig = ecgsig + 0.05 * np.cos(2 * np.pi * w0 / fs * np.arange(1, len(ecgsig) + 1)).T

    fint = w0
    
    return ecgsig, fs, fint

