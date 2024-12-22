from src.wing import Airplane
import numpy as np
from scipy import optimize as opt

pedro = Airplane(1000, 15)

a = [-7, -3, 3, 9]
nice = [-1.994e+07, -1.842e+06, -6.421e+06,  1.039e+07]

pedro.plot(nice)
print(pedro.lift(a))
print(pedro.moment(a))

"""
def objective(x):
    return pedro.moment(x)

ineq = opt.NonlinearConstraint(lambda x: pedro.lift(x), 2, 3)



x0 = np.array([0, 0, 0, 0])

res = opt.minimize(objective, x0, method='SLSQP', constraints=[ineq], options={'xatol': 1e-8, 'disp': True})
print(res)
"""