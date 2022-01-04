program mnozenie
implicit none

real(kind=8), dimension(9) :: tablica1, tablica2
integer(kind=8) :: i

! tablica1 -> pierwiastek z indeksu: sqrt(indeks), indeks**(1/2)

do i=1_8,9_8
    tablica1(i) = sqrt(float(i))  ! konwersja zmiennej do 'real' -> float(i)
    tablica2(i) = i**(1./2)
end do

! tablica1(1)=sqrt(1.)
! tablica1(2)=sqrt(2.)

! .
! .
! .

! tablica(9)=sqrt(9)

!print*,1./2
write(*,*)"tablica1: ",tablica1
write(*,*)"tablica2: ",tablica2

print*,tablica1*tablica2


end program mnozenie
