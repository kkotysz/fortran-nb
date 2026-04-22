program rule30
    implicit none

    integer, allocatable :: aktualna(:), nastepna(:)
    integer :: szerokosc
    integer :: liczba_krokow
    integer :: krok
    integer :: ios
    integer :: stat_alloc
    integer :: stat_dealloc

    write(*, '(a)') 'Automat komorkowy Rule 30: prosta regula, zaskakujaco zlozony wzor.'
    write(*, '(a)') 'Podaj szerokosc (np. 61):'
    read(*, *, iostat=ios) szerokosc
    if (ios /= 0 .or. szerokosc <= 0) then
        write(*, '(a)') 'Blad: szerokosc musi byc dodatnia liczba calkowita.'
        stop 1
    end if

    write(*, '(a)') 'Podaj liczbe krokow (np. 30):'
    read(*, *, iostat=ios) liczba_krokow
    if (ios /= 0 .or. liczba_krokow <= 0) then
        write(*, '(a)') 'Blad: liczba krokow musi byc dodatnia liczba calkowita.'
        stop 1
    end if

    allocate(aktualna(szerokosc), nastepna(szerokosc), stat=stat_alloc)
    if (stat_alloc /= 0) then
        write(*, '(a,i0)') 'Blad allocate, kod stat = ', stat_alloc
        stop 1
    end if

    aktualna = 0
    aktualna((szerokosc + 1) / 2) = 1

    write(*, '(/,a)') 'Legenda: # = 1, . = 0'
    write(*, '(a)') 'Kazdy kolejny wiersz powstaje tylko z 3 sasiadow powyzej.'
    write(*, '(a)') 'Wzor wyglada prawie losowo, ale jest w 100% deterministyczny.'
    write(*, *)

    do krok = 0, liczba_krokow - 1
        call wypisz_wiersz(aktualna, szerokosc, krok)
        call oblicz_nastepny_wiersz(aktualna, nastepna, szerokosc)
        aktualna = nastepna
    end do

    deallocate(aktualna, nastepna, stat=stat_dealloc)
    if (stat_dealloc /= 0) then
        write(*, '(a,i0)') 'Uwaga: deallocate zwrocil kod stat = ', stat_dealloc
        stop 1
    end if

contains

    subroutine oblicz_nastepny_wiersz(biezacy, kolejny, n)
        implicit none
        integer, intent(in) :: n
        integer, intent(in) :: biezacy(n)
        integer, intent(out) :: kolejny(n)
        integer :: i
        integer :: lewy
        integer :: srodek
        integer :: prawy
        integer :: kod

        do i = 1, n
            if (i == 1) then
                lewy = 0
            else
                lewy = biezacy(i - 1)
            end if

            srodek = biezacy(i)

            if (i == n) then
                prawy = 0
            else
                prawy = biezacy(i + 1)
            end if

            ! Kodujemy trojke bitow jako liczbe 0..7: lewy*s4 + srodek*2 + prawy.
            kod = 4 * lewy + 2 * srodek + prawy

            select case (kod)
            case (4, 3, 2, 1)
                kolejny(i) = 1
            case default
                kolejny(i) = 0
            end select
        end do
    end subroutine oblicz_nastepny_wiersz

    subroutine wypisz_wiersz(wiersz, n, numer_kroku)
        implicit none
        integer, intent(in) :: n
        integer, intent(in) :: wiersz(n)
        integer, intent(in) :: numer_kroku
        integer :: i

        write(*, '(i3,2x)', advance='no') numer_kroku
        do i = 1, n
            if (wiersz(i) == 1) then
                write(*, '(a)', advance='no') '#'
            else
                write(*, '(a)', advance='no') '.'
            end if
        end do
        write(*, *)
    end subroutine wypisz_wiersz

end program rule30
