! Link: https://fortran-lang.org/en/learn/quickstart/variables/

program variables
    implicit none

    ! Declare variables (before any executable statements)
    ! All variables must be declared before use
    integer :: i
    real :: x
    character(len=1) :: c
    real :: input

    ! Assign values
    i = 10
    x = 3.14
    c = 'A'

    ! Print variables
    print *, 'The value of i = ', i
    print *, 'The value of x = ', x
    print *, 'The value of c = ', c

    print *, 'Enter a number: ' ! * is a format specifier for standard output
    read(*,*) input ! *,* is a format specifier for standard input and output

    print *, 'You entered: ', input


    


end program variables

