Type Finalization Tests
=======================

Standalone compilation and execution steps and the resulting are below for the
following compilers:

* [NAG]
* [GNU]
* [Cray]

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

[NAG]: #nag
[GNU]: #gnu
[Cray]: #cray
