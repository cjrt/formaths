! A bunch of conversion formula constants
! what the fuck is a kilometer?

module conversions
    use iso_fortran_env, only: real64
    use constants
    integer, parameter :: dp = real64
    
    real(dp), parameter :: deg_to_rad = pi / 180.0_dp
    real(dp), parameter :: rad_to_deg = 180.0_dp / pi
    real(dp), parameter :: inch_to_meter = 0.0254_dp  
    real(dp), parameter :: foot_to_meter = 0.3048_dp    
    real(dp), parameter :: mile_to_meter = 1609.344_dp  
    real(dp), parameter :: pound_to_kg = 0.45359237_dp  
    real(dp), parameter :: meter_to_inch = 39.37007874_dp
    real(dp), parameter :: meter_to_foot = 3.280839895_dp
    real(dp), parameter :: meter_to_mile = 0.00062137119223733_dp
    real(dp), parameter :: kg_to_pound  = 2.20462262184878_dp
    real(dp), parameter :: calorie_to_joule = 4.184_dp
    real(dp), parameter :: atmosphere_to_pascal = 101325.0_dp

end module conversions