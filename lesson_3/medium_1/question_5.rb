def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(27) # Test method call. should print [1, 3, 9, 27]

# BONUS 1: What is the purpose of the number % dividend == 0 ?
# The purpose of the modulo is to make sure you only get integer divisors

# BONUS 2: What is the purpose of the second-to-last line in the method?
# This is the return value of the method