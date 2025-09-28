program star_pattern
    do i = 5, 1, -1
        do j = 1, i
            write(*, '(A)', advance='no') '*'
        end do
        print *, ''
    end do
end program star_pattern
