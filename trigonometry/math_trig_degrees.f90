! fortrans built in trig functions use radians only this is an extension for degrees

module math_trig_degrees
    use conversions, only: to_radians, to_degrees
    implicit none
    private
    public :: sind, cosd, tand, asind, acosd, atand

    real, parameter :: pi = acos(-1.0)

contains

    pure real function sind(x)
        real, intent(in) :: x
        sind = sin(to_radians(x))
    end function sind

    pure real function cosd(x)
        real, intent(in) :: x
        cosd = cos(to_radians(x))
    end function cosd

    pure real function tand(x)
        real, intent(in) :: x
        tand = tan(to_radians(x))
    end function tand

    pure real function asind(x)
        real, intent(in) :: x
        asind = to_degrees(asin(x))
    end function asind

    pure real function acosd(x)
        real, intent(in) :: x
        acosd = to_degrees(acos(x))
    end function acosd

    pure real function atand(x)
        real, intent(in) :: x
        atand = to_degrees(atan(x))
    end function atan

end module math_trig_degrees

