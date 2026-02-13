! fortrans built in trig functions use radians only this is an extension for degrees

module math_trig_degrees
    use constants, only: dp , pi   
    use conversions, only: to_radians, to_degrees
    implicit none
    private
    public :: sind, cosd, tand, asind, acosd, atand

contains

    elemental pure real(dp) function sind(x)
        real(dp), intent(in) :: x
        sind = sin(to_radians(x))
    end function sind

    elemental pure real(dp) function cosd(x)
        real(dp), intent(in) :: x
        cosd = cos(to_radians(x))
    end function cosd

    elemental pure real(dp) function tand(x)
        real(dp), intent(in) :: x
        tand = tan(to_radians(x))
    end function tand

    elemental pure real(dp) function asind(x)
        real(dp), intent(in) :: x
        asind = to_degrees(asin(x))
    end function asind

    elemental pure real(dp) function acosd(x)
        real(dp), intent(in) :: x
        acosd = to_degrees(acos(x))
    end function acosd

    elemental pure real(dp) function atand(x)
        real(dp), intent(in) :: x
        atand = to_degrees(atan(x))
    end function atand

end module math_trig_degrees

