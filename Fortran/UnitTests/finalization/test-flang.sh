# This script was written by Izaak Beekman to help capture and make easier the process of running
# a subset of the Fortran/flang tests from llvm-project/llvm-test-suite
# It assumes you have llvm-project/llvm in a parent directory of llvm-project/llvm-test-suite
# checked out as test-suite, and the test-suite build directory (also under the llvm-project/llvm parent directory)
# is test-suite-build.
# LLVMFlang has been built in a sibling directory to test-suite and test-suite-build simply named build.
# The directory structure should look something like this:
#
# llvm-project           # llvm-project/llvm source code
# ├── build              # Build directory for llvm-project/flang
# ├── test-suite         # llvm-project/llvm-test-suite source code
# └── test-suite-build   # Build directory for test-suite
#
# This script should be run from the test-suite-build directory.
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_Fortran_COMPILER:FILEPATH=/home/users/ibeekman/Sandbox/llvm-project/build/bin/flang-new -DCMAKE_Fortran_FLAGS=-flang-experimental-exec -DTEST_SUITE_FORTRAN:BOOL=On -DTEST_SUITE_SUBDIRS=Fortran/UnitTests/finalization ../test-suite
make -j 8
../build/bin/llvm-lit Fortran/UnitTests/finalization
