!   Bayes Theorem: P(A|B) = [P(B|A) * P(A)] / P(B)
!   tells us how to update our probabiliy P about an event A, after observing some evidence B.
!
!   P(A|B) is the posterior probability, the probability that event A is true after observing some evidence B.
!   P(B|A) is the likelihood, the probability of B occuring given that A has occured.
!   P(A) is the prior probability, what you believed the probability of the event occuring was before you observed the evidence. 
!   P(B) = P(B∣A)P(A) + P(B∣¬A)P(¬A), the marginal, how likely all the observed data is true overall

module bayes_theorem
    use iso_fortran_env, only: dp => real64
    implicit none
    private

    ! Public API
    public :: bayes, bayes_with_complement, marginal_likelihood, is_valid_prob, error_message

    ! Error codes
    integer, parameter, public :: SUCCESS = 0
    integer, parameter, public :: ERROR_INVALID_PROBABILITY = 1
    integer, parameter, public :: ERROR_ZERO_MARGINAL = 2

contains

    pure logical function is_valid_prob(x)
        real(dp), intent(in) :: x
        is_valid_prob = (x >= 0.0_dp .and. x <= 1.0_dp)
    end function is_valid_prob

    pure function bayes(prior, likelihood, marginal, status) result(posterior)
        real(dp), intent(in) :: prior, likelihood, marginal
        integer, intent(out), optional :: status
        real(dp) :: posterior
        integer :: s

        if (.not. is_valid_prob(prior) .or. .not. is_valid_prob(likelihood)) then
            s = ERROR_INVALID_PROBABILITY
            posterior = 0.0_dp
        else if (marginal <= 0.0_dp .or. marginal > 1.0_dp) then
            s = ERROR_ZERO_MARGINAL
            posterior = 0.0_dp
        else
            posterior = (likelihood * prior) / marginal
            posterior = max(0.0_dp, min(1.0_dp, posterior))
            s = SUCCESS
        end if

        if (present(status)) status = s
    end function bayes

    pure function bayes_with_complement(prior, likelihood, likelihood_not, status) result(posterior)
        real(dp), intent(in) :: prior, likelihood, likelihood_not
        integer, intent(out), optional :: status
        real(dp) :: posterior, m
        integer :: s

        m = marginal_likelihood(prior, likelihood, likelihood_not)
        posterior = bayes(prior, likelihood, m, s)
        if (present(status)) status = s
    end function bayes_with_complement

    pure function marginal_likelihood(prior, likelihood, likelihood_not) result(m)
        real(dp), intent(in) :: prior, likelihood, likelihood_not
        real(dp) :: m
        m = likelihood * prior + likelihood_not * (1.0_dp - prior)
    end function marginal_likelihood

    pure function error_message(code) result(msg)
        integer, intent(in) :: code
        character(len=:), allocatable :: msg
        select case (code)
        case (SUCCESS)
            msg = "Success"
        case (ERROR_INVALID_PROBABILITY)
            msg = "Invalid probability (must be in [0,1])"
        case (ERROR_ZERO_MARGINAL)
            msg = "Marginal probability must be greater than 0"
        case default
            msg = "bro idek, wtf did u do"
        end select
    end function error_message

end module bayes_theorem

