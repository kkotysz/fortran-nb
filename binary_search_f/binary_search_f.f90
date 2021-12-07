function binsearch (sorted_array, to_seek)
    integer ::  binsearch
    integer, intent(in) :: to_seek
    integer, dimension(17) :: sorted_array
    integer :: range, left, right, middle

    left =  1
    right = 17
    range = right - left
    middle = (left + right) /2

    do while( sorted_array(middle) /= to_seek .and. range >  0)
        if (to_seek > sorted_array(middle)) then
            left = middle + 1
        else
            right = middle - 1
        end if
        range = right - left
        middle = (left + right)/2
    end do

    if( sorted_array(middle) /= to_seek) then
        binsearch = -1
    else
        binsearch = middle
    end if

end function binsearch

program binary_search_f
    implicit none

    integer :: binsearch
    integer, dimension(17) ::  my_array
    integer :: my_number, idx, i

    do i = 1, 17
        my_array(i) = i**2
    end do

    write(*,*) my_array

    write(*,*) "Enter Value"
    read(*,*) my_number

    idx = binsearch(my_array, my_number)

    if (idx == -1) then
        write(*,*) "Value not found."
    else
        write(*,*) "Value ", my_number, "has index: ", idx
    end if

end program binary_search_f
