program int_elementary_arithmetic_operations
  implicit none
  integer :: a, b

  a = 7
  b = 3

  print *, 'Add:', addints(a, b)
  print *, 'Subtract:', subints(a, b)
  print *, 'Multiply:', mulints(a, b)
  print *, 'Divide:', divints(a, b)

contains
  ! adding with carry logic
  function addints(a, b) result(sum)
    implicit none
    integer, intent(in) :: a, b
    integer :: sum, c, x, y

    x = a
    y = b
    ! bitwise addition algorithm
    do while (y .ne. 0)
       c = iand(x, y) ! AND operation
       x = ieor(x, y) ! XOR operation
       y = ishft(c, 1) ! SHIFT operation
    end do
    sum = x
  end function addints

  ! subtract with two's complement logic
  function subints(a, b) result(diff)
    implicit none
    integer, intent(in) :: a, b
    integer :: diff
    diff = addints(a, addints(not(b), 1))  ! a + the not[reverse] of b then we add 1 to get the two's complement of b
  end function subints

  ! multiply with repeated addition
  function mulints(a, b) result(prod)
    implicit none
    integer, intent(in) :: a, b
    integer :: prod, i, sign, x, y

    prod = 0
    sign = 1
    x = a
    y = b

    ! handle negative numbers
    if (x < 0) then
      ! check if x is negative
      x = -x
      ! if it is negative, flip the sign
      sign = -sign
    end if
    if (y < 0) then
      ! check if y is negative
      y = -y
      ! if it is negative then flip the sign
      sign = -sign
    end if

    ! repeat the addition of x by y times
    do i = 1, y
      ! add x to prod y times
      prod = addints(prod, x)
    end do

    ! take the product and if the sign is negative then flip the sign of the product
    if (sign < 0) prod = -prod
  end function mulints

  ! Division via repeated subtraction
  function divints(a, b) result(quot)
    implicit none
    integer, intent(in) :: a, b
    integer :: quot, tmp, sign, x, y

    if (b == 0) then
      print *, "Undefined! Division by zero"
      stop
    end if

    sign = 1
    x = a
    y = b
    quot = 0

    ! handle negative numbers, same as before
    if (x < 0) then
      x = -x
      sign = -sign
    end if
    if (y < 0) then
      y = -y
      sign = -sign
    end if

    tmp = x
    ! keep subtracting y from tmp while tmp is greater than or equal to y, integer division returns a whole number and ngl its kinda cheeks
    do while (tmp >= y)
      tmp = subints(tmp, y)
      quot = addints(quot, 1)
    end do

    if (sign < 0) quot = -quot
  end function divints

end program int_elementary_arithmetic_operations
