program test_trig
    use math_trig_degrees
    use constants, only: dp
    implicit none

    real(dp) :: x

    x = 90.0_dp

    print *, "sind(90) =", sind(x)
    print *, "cosd(180) =", cosd(180.0_dp)
    print *, "tand(45) =", tand(45.0_dp)

    print *, "atand(1,1) =", atand(1.0_dp)

end program
