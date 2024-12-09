program floating
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    !use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
    implicit none

    ! Explanation:
    ! use is a keyword that allows us to use modules
    ! intrinsic is a module that contains the definition of the intrinsic functions
    ! iso_fortran_env is a module that contains the definition of the intrinsic types
    ! sp is a variable that represents a single precision real number
    ! dp is a variable that represents a double precision real number

    real(sp) :: x_sp
    real(dp) :: x_dp
    ! real(sp) and real(dp) are type specifiers that define the precision of the real number

    x_sp = 1.0_sp / 3.0_sp

    x_dp = 1.0_dp / 3.0_dp

    print *, 'Single precision result: ', x_sp
    print *, 'Double precision result: ', x_dp


    
end program floating