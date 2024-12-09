# Compiling a Program with Modules

## Step 1: Compile files with modules or subroutines
If `functions.f90` contains modules or subroutines, compile it first to generate the object (`.o`) and module (`.mod`) files:

```bash
gfortran -c functions.f90
```

This generates:
`functions.o` (object file).
`functions.mod` (if `functions.f90` contains a module).

## Step 2: Link the files to create the final executable
If another file, such as `tabulate.f90`, depends on `functions.f90`, compile and link them together using the object file:
```bash
gfortran -o executable_name tabulate.f90 functions.o
```

Notes:
- Always compile module files (*.f90) before dependent files.
- Use -c to compile individual files without linking.
- Ensure all required .o and .mod files are available for the final linking step.