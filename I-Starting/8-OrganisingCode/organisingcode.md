# Subroutines
They are called with `call` statement.

``` fortran
! Print matrix A to screen
subroutine print_matrix(n,m,A)
  implicit none
  integer, intent(in) :: n ! The variable is not wrote
  integer, intent(in) :: m
  real, intent(in) :: A(n, m)

  integer :: i

  do i = 1, n
    print *, A(i, 1:m)
  end do

end subroutine print_matrix
```

`intent`:
- `intent(in)`: Read-only
- `intent(out)`: Write-only
- `intent(inout)`: Read-Write

To execute the function:

``` fortran
program call_sub
  implicit none

  real :: mat(10, 20)

  mat(:,:) = 0.0

  call print_matrix(10, 20, mat)

end program call_sub
```


# Functions
They are invoked within an expression or assignment to which it returns a value.

***Good programming practise:*** Functions ***should not*** modify variables

``` fortran
! L2 Norm of a vector
function vector_norm(n,vec) result(norm)
  implicit none
  integer, intent(in) :: n
  real, intent(in) :: vec(n)
  real :: norm

  norm = sqrt(sum(vec**2))

end function vector_norm
```

To execute the function:
``` fortran
program run_fcn
  implicit none

  real :: v(9)
  real :: vector_norm

  v(:) = 9

  print *, 'Vector norm = ', vector_norm(9,v)

end program run_fcn
```

# Modules
Fortran modules contain definitions that are made accessible to programs, procedures, and other modules through the `use` statement.

It is recommended to always place functions and subroutines within modules.

**In Fortran, interface generation provides the compiler with details about how to call a subroutine or function, such as its name, arguments, and their attributes. This ensures correct usage and type checking.** That is the reason why the following code does not have to pass array dimension explicitly to print_matrix

``` fortran
module my_mod
  implicit none

  private  ! All entities are now module-private by default
  public public_var, print_matrix  ! Explicitly export public entities

  real, parameter :: public_var = 2
  integer :: private_var

contains

  ! Print matrix A to screen
  subroutine print_matrix(A)
    real, intent(in) :: A(:,:)  ! An assumed-shape dummy argument

    integer :: i

    do i = 1, size(A,1)
      print *, A(i,:)
    end do

  end subroutine print_matrix

end module my_mod
```

To `use` the module within a program:
```fortran
program use_mod
  use my_mod
  implicit none

  real :: mat(10, 10)

  mat(:,:) = public_var

  call print_matrix(mat)

end program use_mod
``` 

If you only want to use `public_var`:
```fortran
use my_mod, only: public_var
```

Aliased import:
```fortran
use my_mod, only: printMat=>print_matrix
```

*Note: Modules need to be compiled before `use`*