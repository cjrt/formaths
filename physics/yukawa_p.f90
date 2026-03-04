! THIS IS A SOFTENED VERSION OF THE FUNCTION
! never diverges to infinity
! will never divide by 0

module yukawa_p
   use constants, only: dp
   implicit none
   private
   public :: yukawa

contains
    ! d is distance between particles
    ! g is the copling constant
    ! s is the screening constant
    elemental pure real(dp) function yukawa(d, g, s)
    real(dp), intent(in) :: d, g, s

    real(dp), parameter :: mx_compute_epsi = epsilon(1.0_dp)
    real(dp), parameter :: softening = sqrt(mx_compute_epsi)           
            
    real(dp) :: d_sqr 
    d_sqr = d*d            

    yukawa = -g * (exp(-s * d) / sqrt(d_sqr + softening))

    end function yukawa

end module yukawa_p
