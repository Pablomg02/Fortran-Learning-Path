from scipy import integrate
import matplotlib.pyplot as plt
import math
import numpy as np

import warnings

class Airplane:
    def __init__(self, mass: float, wingspan: float):
        warnings.warn("Units are not well defined. Results have to be checked", UserWarning)
        self.mass = mass
        self.weight = mass * 9.8

        self.wingspan = wingspan


    def _4polinomial(self, x : float | np.ndarray, a: list[float]) -> float:
        """
        4th degree polinomial

        Args:
        x: float or np.ndarray in the interval [0, 1]
        a: list of 4 floats. Coefficients of the polinomial in the form a[0] + a[1]*x + a[2]*x^2 + a[3]*x^3
        """

        if not self._check_x(x):
            raise ValueError("x values must be in the interval [0, 1]")
        if not self._check_length(a, 4):
            raise ValueError(f"a must have length 4, but got {len(a)}")
        
        return (a[0]*x**4 + a[1] * x**3 + a[2] * x**2 + a[3] * x)*np.sqrt(1-x**2)
    

    def _4polinomial_x(self, x : float, a: list[float]) -> float:
        return self._4polinomial(x, a)*x # NOTE: Revisar esto
    


    # NOTE: Revisar unidades

    def lift(self, a: list[float]) -> float:
        return integrate.quad(self._4polinomial, 0, 1, args=(a))[0]
    
    def moment(self, a: list[float]) -> float:
        return integrate.quad(self._4polinomial_x, 0, 1, args=(a))[0]
    
    def plot(self, a: list[float]):
        x = np.linspace(0, 1, 100)
        y = self._4polinomial(x, a)
        plt.plot(x, y)
        plt.show()

        




    def _check_x(self, x: float) -> bool:
        """
        Check if x is in the interval [0, 1]
        """
        if isinstance(x, (float, int)):
            return x<= 1 and x>= 0
        elif isinstance(x, np.ndarray):
            return (x<= 1).all() and (x>= 0).all()
        else:
            raise TypeError(f"x must be a float, int or a numpy array, but got {type(x)}")
        

    
    def _check_length(self, a: list[float], length: int) -> bool:
        """
        Check if the length of the list is equal to the length given
        """
        return len(a) == length
    


        
