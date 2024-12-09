program example_allocate
    implicit none
    integer, allocatable :: arr(:)  ! Declaración de array dinámico
    integer :: n

    print *, "Enter the size of the array:"
    read(*,*) n

    allocate(arr(n))  ! Reserva memoria para 'arr' con tamaño 'n'

    print *, "Array of size ", n, " allocated."
end program example_allocate
