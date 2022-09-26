Type Finalization Tests
=======================

Standalone compilation and execution steps and results are below for the
following compilers:

* [NAG]
* [GNU]
* [Cray]
* [Intel]
* [NVIDIA]
* [IBM]

NAG 
---
- Version: 7.1 (Build 7113)
- Result: 0 test failures.
```
nagfor compile_me_only.f90
./a.out
 Pass: finalizes a non-allocatable object on the LHS of an intrinsic assignment
 Pass: finalizes an allocated allocatable LHS of an intrinsic assignment
 Pass: finalizes a target when the associated pointer is deallocated
 Pass: finalizes an object upon explicit deallocation
 Pass: finalizes a non-pointer non-allocatable object at the END statement
 Pass: finalizes a non-pointer non-allocatable object at the end of a block construct
 Pass: finalizes a function reference on the RHS of an intrinsic assignment
 Pass: finalizes a specification expression function result
 Pass: finalizes an intent(out) derived type dummy argument
 Pass: finalizes an allocatable component object
```

GNU 
---
- Version: 12.2.0
- Result: 4 test failures.
```
gfortran compile_me_only.f90
./a.out
 Fail: finalizes a non-allocatable object on the LHS of an intrinsic assignment 
 Fail: finalizes an allocated allocatable LHS of an intrinsic assignment
 Pass: finalizes a target when the associated pointer is deallocated
 Pass: finalizes an object upon explicit deallocation
 Pass: finalizes a non-pointer non-allocatable object at the END statement
 Pass: finalizes a non-pointer non-allocatable object at the end of a block construct
 Fail: finalizes a function reference on the RHS of an intrinsic assignment
 Fail: finalizes a specification expression function result
 Pass: finalizes an intent(out) derived type dummy argument
 Pass: finalizes an allocatable component object
```

Cray
----
- Version: 13.0.1
- Result: 3 test failures.
```
ftn compile_me_only.f90
./a.out
Cray Fortran : Version 13.0.1 fails to compile specification_expression_finalization.f90
Pass: finalizes a non-allocatable object on the LHS of an intrinsic assignment
Fail: finalizes an allocated allocatable LHS of an intrinsic assignment
Pass: finalizes a target when the associated pointer is deallocated
Pass: finalizes an object upon explicit deallocation
Pass: finalizes a non-pointer non-allocatable object at the END statement
Pass: finalizes a non-pointer non-allocatable object at the end of a block construct
Pass: finalizes a function reference on the RHS of an intrinsic assignment
Fail: finalizes a specification expression function result
Fail: finalizes an intent(out) derived type dummy argument
Pass: finalizes an allocatable component object
```

Intel
-----
- Version: 2021.1 Beta Build 20200827
- Result: 2 test failures.
```
ifort compile_me_only.f90
./a.out
Pass: finalizes a non-allocatable object on the LHS of an intrinsic assignment       
Pass: finalizes an allocated allocatable LHS of an intrinsic assignment              
Pass: finalizes a target when the associated pointer is deallocated                  
Pass: finalizes an object upon explicit deallocation                                 
Pass: finalizes a non-pointer non-allocatable object at the END statement            
Pass: finalizes a non-pointer non-allocatable object at the end of a block construct 
Fail: finalizes a function reference on the RHS of an intrinsic assignment           
Pass: finalizes a specification expression function result                           
Pass: finalizes an intent(out) derived type dummy argument
Fail: finalizes an allocatable component object                                      

```

NVIDIA
------
- Version: 22.7-0 64-bit target on x86-64 Linux -tp zen3
- Result: 2 test failures

```
nvfortran compile_me_only.f90
./a.out
Pass: finalizes a non-allocatable object on the LHS of an intrinsic assignment
Fail: finalizes an allocated allocatable LHS of an intrinsic assignment
Pass: finalizes a target when the associated pointer is deallocated
Pass: finalizes an object upon explicit deallocation
Pass: finalizes a non-pointer non-allocatable object at the END statement
Pass: finalizes a non-pointer non-allocatable object at the end of a block construct
Pass: finalizes a function reference on the RHS of an intrinsic assignment
Pass: finalizes a specification expression function result
Fail: finalizes an intent(out) derived type dummy argument
Pass: finalizes an allocatable component object
```

IBM
---
- Version: IBM Open XL Fortran for AIX 17.1.0 
- Result: 1 test failure

In order to for the tests to complete in a way that reports all of the results,
place an exclamation mark (`!`) at the beginning of the following line in the
`compile_me_only.f90` file:
```
,test_result_t("finalizes a specification expression function result", specification_expression()) &
```
which removes the one failing test.  Compiling and excuting the same file then

```
xlf2003_r compile_me_only.f90
./a.out
 Pass: finalizes a non-allocatable object on the LHS of an intrinsic assignment
 Pass: finalizes an allocated allocatable LHS of an intrinsic assignment
 Pass: finalizes a target when the associated pointer is deallocated
 Pass: finalizes an object upon explicit deallocation
 Pass: finalizes a non-pointer non-allocatable object at the END statement
 Pass: finalizes a non-pointer non-allocatable object at the end of a block construct
 Pass: finalizes a function reference on the RHS of an intrinsic assignment
 Pass: finalizes an intent(out) derived type dummy argument
 Pass: finalizes an allocatable component object
```
**Fail:** Separately compiling `specification_expression_finalization.f90` with
`xlf2003_r` causes a core dump. This is a compiler bug that has been reported to
via the Oak Ridge Leadership Computing Facility (OLCF) under ticket OLCFHELP-9069.

[NAG]: #nag
[GNU]: #gnu
[Cray]: #cray
[Intel]: #intel
[NVIDIA]: #nvidia
[IBM]: #ibm
