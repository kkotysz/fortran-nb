program alokowalne
implicit none

integer, dimension(:), allocatable :: dynamiczna
integer :: rozmiar, i

!rozmiar = 19
print*,"Podaj rozmiar tablicy"
read(*,*)rozmiar

print*,"Rozmiar przed alokowaniem: ", size(dynamiczna)
allocate (dynamiczna(rozmiar))
print*,"Rozamiar po alokowaniu: ",size(dynamiczna)

do i=1,rozmiar
    dynamiczna(i)=i
end do
print*,dynamiczna
deallocate(dynamiczna)

end program alokowalne
