Compilers support options like -I to indicate where these include files and module intermediate files are to be found. Suppose we store the two files of our tabulate program in the following directory structure:

```
tabulate/
    main/
        tabulate.f90
    sub/
        functions.f90
```
Compiling the file “functions.f90” with the commands
```bash
$ cd sub
$ gfortran -c functions.f90
```
leads to this structure:
```
tabulate/
    main/
        tabulate.f90
    sub/
        functions.f90
        user_functions.mod
        functions.o
```
To successfully compile and subsequently build the program we need to tell the compiler where it can find the file “user_functions.mod”:
```bash
$ cd main
$ gfortran -c tabulate.f90 -I ../sub
$ gfortran -o tabulate tabulate.o ../sub/functions.o
```