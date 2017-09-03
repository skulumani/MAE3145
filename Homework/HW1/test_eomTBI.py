from HW1 import simTBI
import numpy as np

class Test_eomTBI():
    r10 = [0, 0, 0]
    r20 = [1, 0, 0]
    v10 = [0, 0 ,0]
    v20 = [1, 1, 0]
    initial_state = np.hstack((r10, v10, r20, v20))

    def test_output_size(self):
        state_dot = simTBI.eomTBI(self.initial_state, 0)
        np.testing.assert_equal(state_dot.shape, (12,))

    def test_correct_output(self):
        expected_state_dot = np.array([0, 0, 0, 1, 0, 0, 1, 1, 0, -2, 0, 0])
        np.testing.assert_allclose(simTBI.eomTBI(self.initial_state, 0), expected_state_dot)
