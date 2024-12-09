program arrays
    implicit none

    integer :: a(5)

    ! Custom bounds
    real :: b(-2:2) ! b(-2), b(-1), b(0), b(1), b(2)

    integer :: i

    logical :: xd(3, 3) ! Note: 1 is the first dimension!!

    a = [1, 2, 3, 4, 5]
    b = [(i, i=0, 4)] ! i should be declared before use

    xd(:,1:2) = .true. 
    xd(:,3) = .false.

    print *, 'a: ', a
    print *, 'b: ', b
    print *, 'b(-2): ', b(-2)

    print *, 'xd: ', xd
    print *, 'xd(1, 1): ', xd(1, 1)

    
end program arrays