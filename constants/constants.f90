! A bunch of mathematical and physics constants
! big is an option for bigger precision 
!
! normal[double precision] = 15 decimal places
! big[quadruple precision] = 33 decimal places

module constants
    use iso_fortran_env, only: real64, real128
    implicit none

    ! precision parameters
    integer, parameter :: dp = real64 ! double precision
    integer, parameter :: qp = real128 ! quad precision
    
    ! maths constants, normal
    real(dp), parameter :: pi = 3.141592653589793_dp
    real(dp), parameter :: tau = 6.283185307179586_dp
    real(dp), parameter :: e = 2.718281828459045_dp
    real(dp), parameter :: golden_ratio = 1.618033988749895_dp
    real(dp), parameter :: sqrt2 = 1.414213562373095_dp
    real(dp), parameter :: sqrt3 = 1.732050807568877_dp
    real(dp), parameter :: ln2 = 0.693147180559945_dp
    real(dp), parameter :: ln10 = 2.302585092994046_dp
    real(dp), parameter :: log2e = 1.442695040888963_dp
    real(dp), parameter :: log10e = 0.434294481903252_dp
    
    ! maths constants, big
    real(qp), parameter :: big_pi = 3.14159265358979323846264338327950288419716939937510_qp
    real(qp), parameter :: big_tau = 6.283185307179586476925286766559005_qp
    real(qp), parameter :: big_e = 2.71828182845904523536028747135266249775724709369996_qp
    real(qp), parameter :: big_golden_ratio = 1.61803398874989484820458683436563811772030917980576_qp
    real(qp), parameter :: big_sqrt2 = 1.41421356237309504880168872420969807856967187537695_qp
    real(qp), parameter :: big_sqrt3 = 1.73205080756887729352744634150587236694280525381038_qp
    real(qp), parameter :: big_ln2 = 0.69314718055994530941723212145817656807550013436026_qp
    real(qp), parameter :: big_ln10 = 2.30258509299404568401799145468436420760110148862877_qp
    
    ! physics constants
    real(dp), parameter :: c_light = 299792458.0_dp                    ! Speed of light (m/s)
    real(dp), parameter :: h_planck = 6.62607015e-34_dp                ! Planck constant (J⋅s)
    real(dp), parameter :: k_boltzmann = 1.380649e-23_dp              ! Boltzmann constant (J/K)
    real(dp), parameter :: g_gravitational = 6.67430e-11_dp             ! Gravitational constant (m³/kg⋅s²)
    real(dp), parameter :: e_electron = 1.602176634e-19_dp             ! Elementary charge (C)
    real(dp), parameter :: m_electron = 9.1093837015e-31_dp            ! Electron mass (kg)
    real(dp), parameter :: m_proton = 1.67262192369e-27_dp             ! Proton mass (kg)
    real(dp), parameter :: m_neutron = 1.67492749804e-27_dp            ! Neutron mass (kg)
    real(dp), parameter :: n_avogadro = 6.02214076e23_dp                ! Avogadro's number
    real(dp), parameter :: r_gas = 8.314462618_dp                      ! Gas constant (J/mol⋅K)
    real(dp), parameter :: k_e = 8.9875517923e9_dp                      ! Coulombs constant    

end module constants
