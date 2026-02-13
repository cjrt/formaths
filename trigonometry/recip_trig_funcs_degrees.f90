module recip_trig_funcs_degrees
    use ieee_arithmetic, only: ieee_value, ieee_quiet_nan
    use constants, only: dp
    use math_trig_degrees, only: sind, cosd, tand, asind, acosd, atand
    implicit none
    private

    public :: cscd, secd, cotd, acscd, asecd, acotd

contains

    elemental pure real(dp) function cscd(x)
        real(dp), intent(in) :: x
        if (mod(x, 180.0_dp) == 0.0_dp) then
            cscd = ieee_value(x, ieee_quiet_nan)
        else
            cscd = 1.0_dp / sind(x)
        end if
    end function

    elemental pure real(dp) function secd(x)
        real(dp), intent(in) :: x
        if (mod(abs(x), 180.0_dp) == 90.0_dp) then
            secd = ieee_value(x, ieee_quiet_nan)
        else
            secd = 1.0_dp / cosd(x)
        end if
    end function

    elemental pure real(dp) function cotd(x)
        real(dp), intent(in) :: x
        if (mod(x, 180.0_dp) == 0.0_dp) then
            cotd = ieee_value(x, ieee_quiet_nan)
        else
            cotd = 1.0_dp / tand(x)
        end if
    end function

    elemental pure real(dp) function acscd(x)
        real(dp), intent(in) :: x
        if (abs(x) < 1.0_dp) then
            acscd = ieee_value(x, ieee_quiet_nan)
        else
            acscd = asind(1.0_dp / x)
        end if
    end function

    elemental pure real(dp) function asecd(x)
        real(dp), intent(in) :: x
        if (abs(x) < 1.0_dp) then
            asecd = ieee_value(x, ieee_quiet_nan)
        else
            asecd = acosd(1.0_dp / x)
        end if
    end function

    elemental pure real(dp) function acotd(x)
        real(dp), intent(in) :: x
        ! if acot hits 0 its exactly 90 degrees
        if (x == 0.0_dp) then
            acotd = 90.0_dp
        else
            acotd = atand(1.0_dp / x)
        end if
    end function

end module recip_trig_funcs_degrees
