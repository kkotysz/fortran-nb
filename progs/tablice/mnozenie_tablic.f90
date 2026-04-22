program mnozenie_tablic
    use, intrinsic :: iso_fortran_env, only : dp => real64
    implicit none

    integer, parameter :: n = 9
    integer :: i
    real(dp), dimension(n) :: tablica1
    real(dp), dimension(n) :: tablica2
    real(dp), dimension(n) :: iloczyn

    ! Przyklad: dla kazdego i liczymy sqrt(i) na dwa sposoby.
    do i = 1, n
        tablica1(i) = sqrt(real(i, dp))        ! sqrt(i)
        tablica2(i) = real(i, dp) ** 0.5_dp    ! i**(1/2)
    end do

    ! Mnozenie tablic w Fortranie jest element-po-elemencie.
    iloczyn = tablica1 * tablica2

    write(*, '(a)') 'Porownanie wynikow dla i = 1..9'
    write(*, '(a)') '-------------------------------------------------------'
    write(*, '(a)') '     i      tablica1=sqrt(i)    tablica2=i**0.5     iloczyn'
    write(*, '(a)') '-------------------------------------------------------'

    do i = 1, n
        write(*, '(i6, 3(2x, f14.6))') i, tablica1(i), tablica2(i), iloczyn(i)
    end do

    write(*, '(a)') '-------------------------------------------------------'
    write(*, '(a, f10.4)') 'Suma elementow iloczynu = ', sum(iloczyn)

end program mnozenie_tablic
