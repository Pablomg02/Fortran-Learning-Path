!!! Codigo para calcular los nodos de Chebyshev y los pesos asociados para la cuadratura de Gauss-Chebyshev
!!! Forma de la integral: f(x) / sqrt(1 - x^2)
!!! https://en.wikipedia.org/wiki/Chebyshev%E2%80%93Gauss_quadrature

module gauss_chebyshov
    implicit none
contains
    
    subroutine chebyshev_nodes(a, b, n, x, w)
        ! Calculo de los nodos y pesos de Chebyshev
        implicit none
        real(8), intent(in) :: a, b
        integer, intent(in) :: n
        real(8), intent(out) :: x(n), w(n)
        integer :: i

        do concurrent (i = 1:n)
            !x(i) = 0.5 * (a + b) + 0.5 * (b - a) * cos((2.0 * i - 1.0) * 3.141592653589793d0 / (2.0 * n))
            x(i) = cos((2.0 * i - 1.0) * 3.141592653589793d0 / (2.0 * n))
            w(i) = 3.141592653589793d0 / n ! Peso constante

            print *, "x(", i, ") = ", x(i), " ; w(", i, ") = ", w(i)
        end do
            
    end subroutine chebyshev_nodes


    function gauss(f, x, w, n) result(integral)
        implicit none
        real(8), external :: f
        integer, intent(in) :: n
        real(8), intent(in) :: x(n), w(n)
        real(8) :: integral
        integer :: i

        integral = 0.0d0

        do i = 1, n
            integral = integral + w(i) * f(x(i))
        end do
    end function gauss


end module gauss_chebyshov