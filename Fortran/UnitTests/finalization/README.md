Type Finalization Tests
=======================

Standalone compilation and execution steps and results are below.

NAG Fortran Compiler 7.1 (Build 7113)
-------------------------------------
Result: 0 test failures.
```
% nagfor -f2018 -o specification_expression_finalization specification_expression_finalization.f90
% nagfor -c test_result_m.f90
% nagfor -c main.f90
% nagfor -o test_finalization *.o
% ./test_finalization 

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

GNU Fortran (Homebrew GCC 12.2.0)
---------------------------------
Result: 4 test failures.
```
% gfortran -o specification_expression_finalization specification_expression_finalization.f90
% gfortran -c test_result_m.f90
% gfortran -c main.f90
% gfortran -o test_finalization *.o
% ./test_finalization 

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
