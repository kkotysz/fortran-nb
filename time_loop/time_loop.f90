program multtable

integer :: nrow = 9, ncol = 1e6, i, j

do i=1,nrow
    do j=1,ncol
        write(*, "(2i3)", advance="no")j*i
    end do
    print*
end do

end program multtable
