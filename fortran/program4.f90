program averages
    implicit none
    REAL :: number1
    REAL :: number2
    REAL :: number3
    REAL :: average

    number1 = 3.5
    number2 = 2.75
    number3 = 3.0

    average = (number1+number2+number3) / 3
    write(*, '(A,1X,F4.2)') 'Average is:', average
end program averages