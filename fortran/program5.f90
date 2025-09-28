program go2
    implicit none
    REAL :: usernum

10  write(*, '(A)', advance='no') 'Enter a number less than 10: '
    read(*, *) usernum

    if (usernum >=10) then
        write(*, '(A)') 'Invalid input (>=10).'
        go to 10
    end if

   write(*, '(A)') 'Number is < 10, good job!'
end program go2
