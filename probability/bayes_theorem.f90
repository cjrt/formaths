module bayes_theorem
    use ieee_arithmetic,    only: ieee_value, ieee_quiet_nan
    use constants, only: dp
    implicit none
    private

    public :: bayes, bayes_with_complement, marginal_likelihood, is_valid_prob
    public :: SUCCESS, ERROR_INVALID_PROBABILITY, ERROR_ZERO_MARGINAL

    integer, parameter :: SUCCESS = 0
    integer, parameter :: ERROR_INVALID_PROBABILITY = 1
    integer, parameter :: ERROR_ZERO_MARGINAL = 2

contains

    elemental pure logical function is_valid_prob(x)
        real(dp), intent(in) :: x
        is_valid_prob = (x >= 0.0_dp .and. x <= 1.0_dp)
    end function is_valid_prob

    elemental pure real(dp) function marginal_likelihood(prior, likelihood, likelihood_not)
        real(dp), intent(in) :: prior, likelihood, likelihood_not
        ! P(B) = P(B|A)P(A) + P(B|¬A)P(¬A)
        if (.not. (is_valid_prob(prior) .and. is_valid_prob(likelihood) .and. is_valid_prob(likelihood_not))) then
            marginal_likelihood = ieee_value(prior, ieee_quiet_nan)
        else
            marginal_likelihood = (likelihood * prior) + (likelihood_not * (1.0_dp - prior))
        end if
    end function marginal_likelihood

    elemental pure real(dp) function bayes(prior, likelihood, marginal)
        real(dp), intent(in) :: prior, likelihood, marginal
        if (.not. (is_valid_prob(prior) .and. is_valid_prob(likelihood))) then
            bayes = ieee_value(prior, ieee_quiet_nan)
        else if (marginal <= 0.0_dp .or. marginal > 1.0_dp) then
            bayes = ieee_value(prior, ieee_quiet_nan)
        else
            ! P(A|B) = [P(B|A) * P(A)] / P(B)
            bayes = (likelihood * prior) / marginal
            ! CHECKK numerical safety 
            bayes = max(0.0_dp, min(1.0_dp, bayes))
        end if
    end function bayes

    elemental pure real(dp) function bayes_with_complement(prior, likelihood, likelihood_not)
        real(dp), intent(in) :: prior, likelihood, likelihood_not
        real(dp) :: m
        m = marginal_likelihood(prior, likelihood, likelihood_not)
        bayes_with_complement = bayes(prior, likelihood, m)
    end function bayes_with_complement

end module bayes_theorem

