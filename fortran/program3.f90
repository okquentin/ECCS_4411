program userinput 
    CHARACTER(LEN=100) :: input_name
    CHARACTER(:), ALLOCATABLE :: name

    write(*, '(A)', advance='no') 'What is your name?: '
    read(*,*) input_name
    
    name = trim(adjustl(input_name));
    write(*, '(A,1X,A)') 'Hello', name
end program userinput