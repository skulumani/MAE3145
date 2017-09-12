import numpy as np
import scipy.integrate
import matplotlib.pyplot as plt
import pdb

G = 1
m1 = 2
m2 = 1

def eomTBI(state, t):
    """EOMS
    """
    r1 = state[0:3]
    v1 = state[3:6]
    r2 = state[6:9]
    v2 = state[9:12]


    r = r2-r1 

    R1_dot = v1
    V1_dot = G*m2/np.linalg.norm(r)**3 *r
    R2_dot = v2
    V2_dot = -G*m1/np.linalg.norm(r)**3 *r

    X_dot = np.concatenate((R1_dot, V1_dot, R2_dot, V2_dot))

    return X_dot

def sim():
    # simulate over ten seconds
    r10 = [0, 0, 0]
    r20 = [1, 0, 0]
    v10 = [0, 0 ,0]
    v20 = [1, 1, 0]
    initial_state = np.hstack((r10, v10, r20, v20))
    t = np.linspace(0, 10, 1000)

    sol = scipy.integrate.odeint(eomTBI,initial_state , t)

    # extract out the states
    r1 = sol[:, 0:3]
    v1 = sol[:, 3:6]
    r2 = sol[:, 6:9]
    v2 = sol[:, 9:12]

    # compute the COM
    rcom = (m1*r1 + m2*r2) / (m1 + m2)
    r = r2 - r1

    traj_fig,  traj_ax = plt.subplots()
    traj_ax.plot(r1[:, 0], r1[:, 1], label=r'$r_1$')
    traj_ax.plot(r2[:, 0], r2[:, 1], label=r'$r_2$')
    traj_ax.plot(rcom[:, 0], rcom[:, 1], label=r'$r_c$')
    traj_ax.grid()
    traj_ax.set_title('Inertial Frame')
    traj_ax.set_xlabel('X axis')
    traj_ax.set_ylabel('Y axis')
    plt.legend()

    rel_fig, rel_ax = plt.subplots()
    rel_ax.plot(r[:, 0], r[:, 1])
    rel_ax.plot([0], [0], 'bo', markersize=20)
    rel_ax.set_title('Relative motion of $m_2$ wrt $m_1$')
    rel_ax.set_ylabel('Y axis')
    rel_ax.set_xlabel('X axis')
    rel_ax.grid()
    plt.show()

if __name__ == '__main__':
    sim()
