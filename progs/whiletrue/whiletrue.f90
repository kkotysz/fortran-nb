program whiletrue
implicit none
integer :: i=1

do while (.true.)
    if (i==5) then
        i=i+1
        cycle
    else if (i==10) then
        stop
    end if
    print *,i
    i=i+1
end do
print *,"Koniec pętli"
end program whiletrue
