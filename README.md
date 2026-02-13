<img width="983" height="189" alt="formathslogo" src="https://github.com/user-attachments/assets/92bbb4ae-179f-4ba1-88e6-d781fcd29ae5" />

## A high-performance mathematical extension library for Modern Fortran.

Formaths is a lightweight library designed to bridge the gap between Fortran's intrinsic functions and the complex requirements of modern numerical computing. It provides extra utilitiesto developers who want more than what Fortran offers "out of the box". 

### Features

Pure Fortran: Written entirely in Fortran 2008. No external dependencies or C-interoperability requirements.

Standards Compliant: Fully compatible with gfortran and any compiler supporting the Fortran 2008 standard.

High Performance: Uses elemental and pure procedures where possible to allow for seamless array-based operations and parallel execution.

Static Integration: Compiles into a lightweight .a static library for easy linking into larger projects.

### Modules

Formaths is organzied into modules that can be imported independently

IN PROGRESS

### Building & Linking

**MAKE SURE YOU HAVE THE GCC INSTALLED**

Formaths uses a single makefile that contains everything needed. 

To compile the library and generate the build directory:

```bash

git clone git@github.com:cjrt/formaths.git
cd formaths

make

```

The compiled .mod files will be located in the /build directory. The static libary will be in the main directory under the name "libformaths.a"
