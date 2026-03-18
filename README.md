# fortran-nb

## 1) Jak zainstalować Fortrana

Najprościej zacząć od kompilatora `gfortran`.

### macOS

1. Zainstaluj Homebrew: https://brew.sh/
2. Zainstaluj GCC (zawiera `gfortran`):

```bash
brew install gcc
```

3. Sprawdź instalację:

```bash
gfortran --version
```

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install gfortran
gfortran --version
```

### Windows

Najwygodniej przez MSYS2:

1. Zainstaluj MSYS2: https://www.msys2.org/
2. Otwórz terminal `MSYS2 UCRT64` i wykonaj:

```bash
pacman -Syu
pacman -S mingw-w64-ucrt-x86_64-gcc-fortran
gfortran --version
```

## 2) Jakich edytorów można używać do pisania kodu

Do zajęć i codziennej pracy dobrze sprawdzają się:

- Visual Studio Code (z rozszerzeniami Fortran i debuggerem)
- Vim lub Neovim (dla osób lubiących terminal)
- Notepad++ (lekka opcja na Windows)

Do samej nauki na start polecam VS Code + terminal z `gfortran`.

### Linki (oficjalne strony)

- Visual Studio Code: https://code.visualstudio.com/
- Neovim: https://neovim.io/
- Notepad++: https://notepad-plus-plus.org/downloads/

### Screeny (podgląd interfejsu)

- VS Code (tutorial z obrazami interfejsu): https://code.visualstudio.com/docs/getstarted/getting-started
- Neovim (oficjalna galeria screenów): https://neovim.io/screenshots/
- Notepad++ (interfejs w dokumentacji): https://npp-user-manual.org/docs/user-interface/

[GFortran - instalacja kompilatora](https://gcc.gnu.org/wiki/GFortranBinaries)

[Dokumentacja](https://gcc.gnu.org/onlinedocs/gfortran/)

[Intrinsic procedures](https://gcc.gnu.org/onlinedocs/gfortran/Intrinsic-Procedures.html)

[FORTRAN - tutorialspoint](https://www.tutorialspoint.com/fortran/fortran_basic_syntax.htm)

[FORTRAN - tutorial (Yutaka Masuda)](https://masuday.github.io/fortran_tutorial/index.html)
