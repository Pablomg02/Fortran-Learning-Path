(Enlace)[https://fortran-lang.org/en/learn/quickstart/operators_control_flow/]

# If
``` fortran
if (angle < 90.0) then
  print *, 'Angle is acute'
else if (angle < 180.0) then
  print *, 'Angle is obtuse'
else
  print *, 'Angle is reflex'
end if
```

# Do
***Structure:*** do *start, end, step (optional)*
``` fortran
integer :: i

do i = 1, 10, 2
  print *, i  ! Print odd numbers
end do
```

## Do while
``` fortran
integer :: i

i = 1
do while (i < 11)
  print *, i
  i = i + 1
end do
! Here i = 11
```

## Loop control statements:
- `exit`: used to quit the loop prematurely
- `cycle`: skips whatever is left of the loop and goes into the next cycle

``` fortran
integer :: i

do i = 1, 10
  if (mod(i, 2) == 0) then
      cycle  ! Don't print even numbers
  end if
  print *, i
end do
```

## Tags:
Used to improve readability and use `exit` and `cycle` with tags.

``` fortran
integer :: i, j

outer_loop: do i = 1, 10
  inner_loop: do j = 1, 10
    if ((j + i) > 10) then  ! Print only pairs of i and j that add up to 10
      cycle outer_loop  ! Go to the next iteration of the outer loop
    end if
    print *, 'I=', i, ' J=', j, ' Sum=', j + i
  end do inner_loop
end do outer_loop
```

## Parallelizable loop
The do concurrent loop is used to explicitly specify that the inside of the loop has no interdependencies.
 ``` fortran
 real, parameter :: pi = 3.14159265
integer, parameter :: n = 10
real :: result_sin(n)
integer :: i

do concurrent (i = 1:n)  ! Careful, the syntax is slightly different
  result_sin(i) = sin(i * pi/4.)
end do

print *, result_sin
```