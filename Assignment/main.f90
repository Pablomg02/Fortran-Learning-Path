program main
    use chebyshev_module
    implicit none

    integer :: n, i
    real(8) :: a, b
    real(8), allocatable :: x(:), w(:)
    real :: start_time, end_time

    ! Solicitar los valores de a, b y n al usuario
    print *, "Introduce el valor de a:"
    read *, a
    print *, "Introduce el valor de b:"
    read *, b
    print *, "Introduce el numero de nodos n:"
    read *, n

    call cpu_time(start_time)

    ! Si yo hago aqui el allocate, se vuelve loco con la referencia y printea la direccion de memoria. Investigarlo

    ! Llamar a la subrutina para calcular los nodos y pesos
    call chebyshev_nodes(a, b, n, x, w)

    call cpu_time(end_time)

    ! Imprimir los nodos calculados
    print *, "Nodos de Chebyshev:"
    do i = 1, n
        print *, "x(", i, ") = ", x(i), " ; w(", i, ") = ", w(i)
    end do

    ! Liberar memoria
    deallocate(x)
    deallocate(w)

    print *, "Tiempo de calculo: ", end_time - start_time

end program main