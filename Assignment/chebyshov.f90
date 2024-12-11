module chebyshev_module
    implicit none
contains
    
    subroutine chebyshev_nodes(a, b, n, x, w)
        implicit none
        real(8), intent(in) :: a, b
        integer, intent(in) :: n
        real(8), allocatable, intent(out) :: x(:), w(:)
        integer :: i
        
        ! Asignar memoria para los arrays de nodos y pesos
        allocate(x(n))
        allocate(w(n))

        ! Calcular los nodos de Chebyshev usando do concurrent
        do concurrent (i = 1:n)
            x(i) = 0.5 * (a + b) + 0.5 * (a - b) * cos((2.0 * i - 1.0) * 3.141592653589793d0 / (2.0 * n))
            w(i) = 3.141592653589793d0 / n ! Peso constante
        end do
    end subroutine chebyshev_nodes

end module chebyshev_module