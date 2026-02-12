! conversion formulas, using constants

module conversions
    use constants
    implicit none
    private

    public :: to_radians, to_degrees
    public :: to_meters, to_inches, to_feet, to_miles
    public :: to_kilograms, to_pounds
    public :: to_joules
    public :: to_pascals

    real(dp), parameter :: deg_to_rad_scale = tau / 360.0_dp
    real(dp), parameter :: rad_to_deg_scale = 360.0_dp / tau

    real(dp), parameter :: inch_to_meter_scale = 0.0254_dp
    real(dp), parameter :: foot_to_meter_scale = 0.3048_dp
    real(dp), parameter :: mile_to_meter_scale = 1609.344_dp
    real(dp), parameter :: pound_to_kg_scale   = 0.45359237_dp
    real(dp), parameter :: calorie_to_joule_scale = 4.184_dp
    real(dp), parameter :: atm_to_pa_scale = 101325.0_dp

contains

    ! converts degrees to radians    
    pure real(dp) function to_radians(x)
        real(dp), intent(in) :: x
        to_radians = x * deg_to_rad_scale
    end function
    
    ! converts radians to degrees            
    pure real(dp) function to_degrees(x)
        real(dp), intent(in) :: x
        to_degrees = x * rad_to_deg_scale
    end function

    ! converts imperial length units to metric
    pure real(dp) function to_meters(x, unit)
        real(dp), intent(in) :: x
        character(*), intent(in) :: unit

        select case (trim(adjustl(unit)))
        case ("inch")
            to_meters = x * inch_to_meter_scale
        case ("foot")
            to_meters = x * foot_to_meter_scale
        case ("mile")
            to_meters = x * mile_to_meter_scale
        case default
            to_meters = x
        end select
    end function

    ! converts meters to inches    
    pure real(dp) function to_inches(x)
        real(dp), intent(in) :: x
        to_inches = x / inch_to_meter_scale
    end function

    ! converts meters to feet
    pure real(dp) function to_feet(x)
        real(dp), intent(in) :: x
        to_feet = x / foot_to_meter_scale
    end function

    ! converts meters to miles            
    pure real(dp) function to_miles(x)
        real(dp), intent(in) :: x
        to_miles = x / mile_to_meter_scale
    end function

    ! converts pounds to kilograms
    pure real(dp) function to_kilograms(x)
        real(dp), intent(in) :: x
        to_kilograms = x * pound_to_kg_scale
    end function
    
    ! converts kilograms to pounds, using inverse          
    pure real(dp) function to_pounds(x)
        real(dp), intent(in) :: x
        to_pounds = x / pound_to_kg_scale
    end function

    ! converts calories to joules
    pure real(dp) function to_joules(x)
        real(dp), intent(in) :: x
        to_joules = x * calorie_to_joule_scale
    end function

    ! standatrd pressure to pascals            
    pure real(dp) function to_pascals(x)
        real(dp), intent(in) :: x
        to_pascals = x * atm_to_pa_scale
    end function

end module conversions

