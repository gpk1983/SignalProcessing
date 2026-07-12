import numpy as np
import matplotlib.pyplot as plt

# ----- Βοηθητικές συναρτήσεις (μόνο numpy) -----
def spectrum(x, fs):
    """Μονόπλευρο φάσμα πλάτους |X(f)|."""
    N = len(x)
    X = np.fft.rfft(x) / N
    f = np.fft.rfftfreq(N, 1/fs)
    mag = np.abs(X)
    mag[1:] *= 2.0            # μονόπλευρο -> διπλασιάζουμε (εκτός DC)

    return f, mag

def lowpass(x, cutoff, fs):
    """Ιδανικό χαμηλοπερατό φίλτρο στο πεδίο συχνότητας."""
    N = len(x)
    X = np.fft.rfft(x)
    f = np.fft.rfftfreq(N, 1/fs)
    X[f > cutoff] = 0.0

    return np.fft.irfft(X, n=N)

def analytic(x):
    """Αναλυτικό σήμα (μετασχηματισμός Hilbert) μέσω FFT."""
    N = len(x)
    X = np.fft.fft(x)
    h = np.zeros(N)

    if N % 2 == 0:
        h[0] = h[N//2] = 1; h[1:N//2] = 2
    else:
        h[0] = 1; h[1:(N+1)//2] = 2
    return np.fft.ifft(X * h)

def tf(sig, fs, ttl, tmax=0.05, fmax=1600, ref=None):
    """Απεικόνιση σήματος σε χρόνο ΚΑΙ συχνότητα (input/output, both domains)."""
    N = len(sig); t = np.arange(N)/fs
    f, mag = spectrum(sig, fs); m = f <= fmax
    fig, ax = plt.subplots(1, 2, figsize=(12, 3.2))
    ax[0].plot(t, sig, lw=1)

    if ref is not None:
        ax[0].plot(t, ref, 'r--', lw=1.1, alpha=0.8, label='περιβάλλουσα')
        ax[0].legend(loc='upper right')

    ax[0].set_xlim(0, tmax); ax[0].grid(alpha=0.3)
    ax[0].set_title(ttl + ' — πεδίο χρόνου'); ax[0].set_xlabel('t (s)')
    ax[1].stem(f[m], mag[m], basefmt=' ', markerfmt='^')
    ax[1].set_xlim(0, fmax); ax[1].grid(alpha=0.3)
    ax[1].set_title(ttl + ' — φάσμα |X(f)|'); ax[1].set_xlabel('f (Hz)')
    plt.tight_layout(); 
    plt.show()