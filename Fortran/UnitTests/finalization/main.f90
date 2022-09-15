program main
  !! Test each scenario in which the Fortran 2018 standard
  !! requires type finalization.
  use test_result_m, only : test_result_t, get_test_results
  implicit none
  type(test_result_t), allocatable :: test_results(:)
  integer i

  test_results = get_test_results()

  do i=1,size(test_results)
    print *, report(test_results(i)%outcome), test_results(i)%description
  end do

contains

  pure function report(outcome)
    logical, intent(in) :: outcome
    character(len=:), allocatable ::  report 
    report = merge("Pass: ", "Fail: ", outcome)
  end function

end program