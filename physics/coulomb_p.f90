module coulomb_p
   use constants, only: dp, k_e
   private
   public :: coulomb      
   implicit none

contains
    elemental pure real(dp) function coulomb(d, q1, q2)
    real(dp), intent(in) :: d, q1, q2
    
    real(dp), parameter :: mx_compute_epsi = epsilon(1.0_dp)
    real(dp), parameter :: softening = sqrt(mx_compute_epsi)           
            
    real(dp) :: d_sqr
    real(dp) :: c_pd 

    d_sqr = d*d
    c_pd = q1*q2            
 
    coulomb = (k_e * c_pd) / sqrt(d_sqr + softening)

    end function coulomb

end module coulomb_p
