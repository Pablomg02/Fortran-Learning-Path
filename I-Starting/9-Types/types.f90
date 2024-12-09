program types
    implicit none

    type :: t_pair
        integer :: i
        real :: x
    end type

    ! Declare a variable of type t_pair
    type(t_pair) :: p
    ! Initialize the variable
    p = t_pair(1, 3.14)

    ! Print the variable
    print *, p
    
end program types