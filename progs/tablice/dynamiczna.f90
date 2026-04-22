program tablica_dynamiczna
    implicit none

    integer, allocatable :: dynamiczna(:)
    integer :: rozmiar
    integer :: i
    integer :: ios
    integer :: stat_alloc
    integer :: stat_dealloc

    write(*, '(a)') 'Program pokazuje, jak dziala tablica allocatable.'
    write(*, '(a)') 'Podaj dodatni rozmiar tablicy:'
    read(*, *, iostat=ios) rozmiar

    if (ios /= 0) then
        write(*, '(a)') 'Blad: to nie jest poprawna liczba calkowita.'
        stop 1
    end if

    if (rozmiar <= 0) then
        write(*, '(a)') 'Blad: rozmiar musi byc wiekszy od zera.'
        stop 1
    end if

    write(*, '(/,a,l1)') 'Czy tablica jest alokowana przed allocate? ', allocated(dynamiczna)
    if (allocated(dynamiczna)) then
        write(*, '(a,i0)') 'Rozmiar przed allocate = ', size(dynamiczna)
    else
        write(*, '(a)') 'Rozmiar przed allocate = brak (tablica nie zajmuje pamieci).'
    end if

    allocate(dynamiczna(rozmiar), stat=stat_alloc)
    if (stat_alloc /= 0) then
        write(*, '(a,i0)') 'Blad allocate, kod stat = ', stat_alloc
        stop 1
    end if

    write(*, '(a,l1)') 'Czy tablica jest alokowana po allocate? ', allocated(dynamiczna)
    write(*, '(a,i0)') 'Rozmiar po allocate = ', size(dynamiczna)

    ! Wypelniamy tablice prostym wzorem: a(i) = i^2.
    do i = 1, rozmiar
        dynamiczna(i) = i * i
    end do

    write(*, '(/,a)') 'Zawartosc tablicy (indeks, wartosc):'
    write(*, '(a)') '------------------------------'
    do i = 1, rozmiar
        write(*, '(i6, 2x, i10)') i, dynamiczna(i)
    end do
    write(*, '(a)') '------------------------------'
    write(*, '(a,i0)') 'Suma elementow = ', sum(dynamiczna)

    deallocate(dynamiczna, stat=stat_dealloc)
    if (stat_dealloc /= 0) then
        write(*, '(a,i0)') 'Uwaga: deallocate zwrocil kod stat = ', stat_dealloc
        stop 1
    end if

    write(*, '(/,a,l1)') 'Czy tablica jest alokowana po deallocate? ', allocated(dynamiczna)

end program tablica_dynamiczna
