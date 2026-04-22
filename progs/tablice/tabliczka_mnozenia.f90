program tabliczka_mnozenia
    implicit none

    integer, allocatable :: tabela(:, :)
    integer :: n
    integer :: i
    integer :: j
    integer :: ios
    integer :: stat_alloc
    integer :: stat_dealloc

    write(*, '(a)') 'Program wypisuje tabliczke mnozenia n x n.'
    write(*, '(a)') 'Podaj dodatni rozmiar n:'
    read(*, *, iostat=ios) n

    if (ios /= 0) then
        write(*, '(a)') 'Blad: podaj liczbe calkowita.'
        stop 1
    end if

    if (n <= 0) then
        write(*, '(a)') 'Blad: n musi byc wieksze od zera.'
        stop 1
    end if

    if (n > 20) then
        write(*, '(a)') 'Uwaga: dla n > 20 wydruk moze byc malo czytelny.'
    end if

    allocate(tabela(n, n), stat=stat_alloc)
    if (stat_alloc /= 0) then
        write(*, '(a,i0)') 'Blad allocate, kod stat = ', stat_alloc
        stop 1
    end if

    ! Wypelniamy tablice: tabela(i,j) = i*j.
    do i = 1, n
        do j = 1, n
            tabela(i, j) = i * j
        end do
    end do

    write(*, '(/,a)') 'Tabliczka mnozenia:'
    write(*, '(a)', advance='no') ' i\j |'
    do j = 1, n
        write(*, '(i5)', advance='no') j
    end do
    write(*, *)

    write(*, '(a)', advance='no') '-----+'
    do j = 1, n
        write(*, '(a)', advance='no') '-----'
    end do
    write(*, *)

    do i = 1, n
        write(*, '(i4,a)', advance='no') i, ' |'
        do j = 1, n
            write(*, '(i5)', advance='no') tabela(i, j)
        end do
        write(*, *)
    end do

    write(*, '(/,a,i0,a,i0,a,i0)') 'Przyklad: ', n, ' * ', n, ' = ', tabela(n, n)

    deallocate(tabela, stat=stat_dealloc)
    if (stat_dealloc /= 0) then
        write(*, '(a,i0)') 'Uwaga: deallocate zwrocil kod stat = ', stat_dealloc
        stop 1
    end if

end program tabliczka_mnozenia
