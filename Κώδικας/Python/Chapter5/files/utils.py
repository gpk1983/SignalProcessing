import matplotlib.pyplot as plt
import numpy as np


def ctft(ss, tt, ff, plot=True):
    """
    Συνάρτηση που υπολογίζει το μετασχ. Fourier ενός σήματος
    Ορίσματα: ss : σήμα στο χρόνο
              tt : άξονας χρόνου
              ff : άξονας συχνότητας
              plot = False: εκτύπωση σχημάτων
    Έξοδος: τρια σχήματα με το σήμα στο χρόνο, και τα δυο φάσματα
    ή
            τρια διανύσματα με το Μετασχ. Fourier, το μέτρο του, και τη συνάρτηση φάσης του
    """
    m = np.exp(-1j*2*np.pi*np.outer(ff, tt))  # Fourier Matrix
    x = (tt[1] - tt[0])*m@ss[:, None]       # Fourier Transform
    absx = np.abs(x)                        # Magnitude
    angx = np.unwrap(np.angle(x))           # Unwrapped Phase

    if not plot:
        return x, absx, angx
    
    fig, axes = plt.subplots(1, 3)
    fig.set_figheight(4)
    fig.set_figwidth(16)

    # Signal in time:
    axes[0].plot(ss, linewidth=1)
    axes[0].set_xlim([0, len(ss)])
    axes[0].set_xlabel("Time $(s)$")
    axes[0].set_ylabel("Amplitude")
    axes[0].set_title("Signal in time")
    axes[0].grid()

    # Fourier Magnitude:
    axes[1].plot(ff, absx, linewidth=2)
    #axes[1].set_xlim([ff[0], ff[-1]+1])
    #axes[1].set_ylim([min(absx), max(absx)])
    axes[1].set_xlabel("Frequency (Hz)")
    axes[1].set_ylabel("Magnitude")
    axes[1].set_title("Magnitude of CT FT")
    axes[1].grid()

    # Unwrapped Fourier Phase:
    axes[2].plot(ff, angx, linewidth=2)
    #axes[2].set_xlim([ff[0], ff[-1]+1])
    #axes[2].set_ylim([min(angx), max(angx)])
    axes[2].set_xlabel("Frequency (Hz)")
    axes[2].set_ylabel("Radians")
    axes[2].set_title("Phase of CT FT")
    axes[2].grid()

    plt.draw()
    plt.show()
    return x, absx, angx



def rect(time_axis, dt, A=1, T=1, t_0=0):
    """
    Παράμετροι:
    ----------
    time_axis: ndarray
        άξονας του χρόνου (χωρίς έξτρα διάσταση)
    dt: ndarray
        βήμα στο χρόνο 
    A: float
        πλάτος του τετραγωνικού παλμού 
    T: float
        διάρκεια ολόκληρου παλμού 
    t_0: float
        μετατόπιση: (καθυστέρηση για t_0>0, προήγηση για t_0<0)
    Επιστρέφει:
    -------
    ndarray
        rect(t/T) = {A, t στο (-T/2, T/2)
                    {0, αλλού.
    """
    xx = np.zeros(shape=time_axis.shape)
    origin = int(len(time_axis)/2 + t_0/dt)
    range1 = origin - int(T/dt)//2
    range2 = origin + int(T/dt)//2
    xx[range1:range2] = A
    
    return xx


def tri(time_axis, dt, A=1, T=1, t_0=0):
    """
    Παράμετροι:
    ----------
    time_axis: ndarray
        άξονας του χρόνου (χωρίς έξτρα διάσταση)
    dt: ndarray
        βήμα στο χρόνο 
    A: float
        πλάτος του τριγωνικού παλμού 
    T: float
        διάρκεια ΜΙΣΟΥ παλμού 
    t_0: float
        μετατόπιση: (καθυστέρηση για t_0>0, προήγηση για t_0<0)
    Επιστρέφει:
    -------
    ndarray
        Atri(t/T) = {A(1-|t|/T), t στο (-T, T)
                    {0, αλλού.
    """
    xx = np.zeros(shape=time_axis.shape)
    origin = int(len(time_axis)/2+t_0/dt)
    range1 = origin - int(T/dt)
    range2 = origin + int(T/dt)
    xx[range1:origin] = np.linspace(start=0, stop=A, num=origin-range1)
    xx[origin:range2] = np.linspace(start=A, stop=0, num=range2-origin)
    
    return xx



def ctft2ictft(freq, df, time, dt, xx):
    """
    Continuous-Time FT to Inverse Continuous-Time FT
    
    Παράμετροι:
    ----------
    freq: ndarray
        άξονας της συχνότητας (χωρίς την έξτρα διάσταση)
    df: ndarray
        βήμα στη συχνότητα
    time: ndarray
        άξονας του χρόνου (χωρίς την έξτρα διάσταση)
    dt: ndarray
        βήμα στο χρόνο
    xx: ndarray
        σήμα στο χρόνο
    Επιστρέφει:
    -------
    x_inv: ndarray
        το σήμα στο χρόνο υπολογισμένο μέσω του μετασχηματισμού Fourier, ως αποτέλεσμα της ακολουθίας πράξεων: 
        
                                              xx(t) -> X(f) -> x_inv(t)
    """
    ff = np.expand_dims(freq, axis=0)                 # Βάζουμε την έξτρα διάσταση
    tt = np.expand_dims(time, axis=0)                 # ---------- "" ------------
    
    M = np.exp(-1j*2*np.pi*ff.T@tt)                   # [N x 1] * [1 x L] = [N x L]
    X_f = dt * xx @ M.T                               # [1 x L] * [L x N] = [1 x N]
    
    M_inv = np.exp(1j*2*np.pi*tt.T@ff)                # [L x 1] * [1 x N] = [L x N]
    x_inv = df * X_f @ M_inv.T                        # [1 x N] * [N x L] = [1 x L]
    
    x_inv = np.squeeze(x_inv)                         # Βγάζουμε την έξτρα διάσταση που μπήκε για να γίνουν οι πράξεις
    
    return x_inv



def plotter(time, signal, signal_est, title):
    """
    Παράμετροι:
    ----------
    time: ndarray
        άξονας του χρόνου (χωρίς την έξτρα διάσταση)
    signal: ndarray
        σήμα στο χρόνο (original) (χωρίς την έξτρα διάσταση)
    signal_est: ndarray
        σήμα στο χρόνο (προσέγγιση μέσω μετασχ. Fourier) (χωρίς την έξτρα διάσταση)
    title: string
        τίτλος γραφήματος
    Επιστρέφει:
    -------
    Γράφημα
    """
    
    plt.figure(figsize=(12,4))
    plt.plot(time, signal, linewidth=2, label="Theory")
    plt.plot(time, signal_est, 'r', linewidth=2, label="Practice")
    plt.title(title, fontsize=18)
    plt.xlabel("Χρόνος (s)", fontsize=18)
    plt.ylabel("Πλάτος", fontsize=18)
    plt.legend()
    plt.grid()
    plt.show()
    return