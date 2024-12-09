program string_array
    implicit none

    character(len=10) :: keys(2), vals(2) ! Array of strings, each of length 10
  
    keys = [character(len=10) :: "user", "dbname"]
    vals = [character(len=10) :: "ben", "motivation"]
  ! character(len=10) is used because it has to be the same as the length of the declared array

    call show(keys, vals)
  
    contains
  
    subroutine show(akeys, avals)
      character(len=*), intent(in) :: akeys(:), avals(:) ! * means the length is not specified
      ! intent specifies the direction of the data flow (in, out, inout). For example, intent(in) means that the data is read-only.
      integer                      :: i
  
      do i = 1, size(akeys) ! size returns the number of elements in the array
        print *, trim(akeys(i)), ": ", trim(avals(i)) ! trim removes trailing spaces
      end do
  
    end subroutine show
  
  end program string_array