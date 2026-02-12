! TODO in a lot of these functions if x = 0 itll divide by zero, let IEEE handle that for now but add guard rails later

module recip_trig_funcs_degrees
    use constants,          only: dp
    use math_trig_degrees,  only: sind, cosd, tand, asind, acosd, atand
    implicit none
    private

    public :: cscd, secd, cotd
    public :: acscd, asecd, acotd

contains

    pure real(dp) function cscd(x)
        real(dp), intent(in) :: x
        cscd = 1.0_dp / sind(x)
    end function

    pure real(dp) function secd(x)
        real(dp), intent(in) :: x
        secd = 1.0_dp / cosd(x)
    end function

    pure real(dp) function cotd(x)
        real(dp), intent(in) :: x
        cotd = 1.0_dp / tand(x)
    end function

    pure real(dp) function acscd(x)
        real(dp), intent(in) :: x
        acscd = asind(1.0_dp / x)
    end function

    pure real(dp) function asecd(x)
        real(dp), intent(in) :: x
        asecd = acosd(1.0_dp / x)
    end function

    pure real(dp) function acotd(x)
        real(dp), intent(in) :: x
        acotd = atand(1.0_dp / x)
    end function

end module recip_trig_funcs_degrees
