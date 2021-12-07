program binary_search

    implicit none
    integer, dimension(17) ::  sorted_array
    integer :: range, left, right, middle
    integer :: i, to_seek

    do i = 1, 17
        sorted_array(i) = i**2
    end do

    write(*,*) sorted_array

    write(*,*) 'Enter Value'
    read(*,*) to_seek

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
        write(*,*) to_seek, 'NOT FOUND'
    else
        write(*,*) "Value ", to_seek, "has index: ", middle
    end if

end program binary_search
