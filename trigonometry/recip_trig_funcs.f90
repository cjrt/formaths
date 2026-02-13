module recip_trig_funcs
    use constants, only: dp, pi
    use ieee_arithmetic, only: ieee_value, ieee_quiet_nan, ieee_is_nan
    implicit none
    private 

    public :: sec, csc, cot, arcsec, arccsc, arccot

contains

    elemental pure real(dp) function sec(x)
        real(dp), intent(in) :: x
        sec = 1.0_dp / cos(x)
    end function sec

    elemental pure real(dp) function csc(x)
        real(dp), intent(in) :: x
        csc = 1.0_dp / sin(x)
    end function csc

    elemental pure real(dp) function cot(x)
        real(dp), intent(in) :: x
        cot = cos(x) / sin(x)
    end function cot

    elemental pure real(dp) function arcsec(x)
        real(dp), intent(in) :: x
        if (abs(x) < 1.0_dp) then
            arcsec = ieee_value(x, ieee_quiet_nan)
        else
            arcsec = acos(1.0_dp / x)
        end if
    end function arcsec

    elemental pure real(dp) function arccsc(x)
        real(dp), intent(in) :: x
        if (abs(x) < 1.0_dp) then
            arccsc = ieee_value(x, ieee_quiet_nan)
        else
            arccsc = asin(1.0_dp / x)
        end if
    end function arccsc

    elemental pure real(dp) function arccot(x)
        real(dp), intent(in) :: x
        arccot = atan2(1.0_dp, x)
        if (arccot < 0.0_dp) arccot = arccot + pi
    end function arccot

end module recip_trig_funcs
