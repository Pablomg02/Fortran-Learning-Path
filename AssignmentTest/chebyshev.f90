!!! Codigo para calcular los nodos de Chebyshev y los pesos asociados para la cuadratura de Gauss-Chebyshev
!!! Forma de la integral: f(x) / sqrt(1 - x^2)
!!! https://en.wikipedia.org/wiki/Chebyshev%E2%80%93Gauss_quadrature

program chebyshev_nodes
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
  ! Esto es interesante, porque el call, al llamar a subrutinas,
  ! no va a devolver ningun valor. Por eso se le pasa la variable

  ! Asignar memoria para el array de nodos
  allocate(x(n))
  allocate(w(n))

  ! Calcular los nodos de Chebyshev usando do concurrent
  do concurrent (i = 1:n)
    x(i) = 0.5 * (a + b) + 0.5 * (a - b) * cos((2.0 * i - 1.0) * 3.141592653589793d0 / (2.0 * n))
    w(i) = 3.141592653589793d0 / n ! Podriamos ahorrarnos ya que el peso es constante, pero lo dejo por si se quiere cambiar
  end do

  call cpu_time(end_time)

  ! Imprimir los nodos calculados
  print *, "Nodos de Chebyshev:"
  do i = 1, n
    print *, "x(", i, ") = ", x(i)," ; w(",i,") = ", w(i)
  end do

  ! Liberar memoria
  deallocate(x)
  
  print *, "Tiempo de calculo: ", end_time - start_time

end program chebyshev_nodes
  