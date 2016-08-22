numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# The output of this code would be:
#  1
#  3

# Because shift(1) removes 1 item while its iterating, so after
# printing 1, it removes 2. Then it prints 3 and removes 4.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# The output of this code would be:
#  1
#  2

# Because pop(1) removes 1 item from the end of the array while iterating. So,
# it would print 1, remove 4. Print 2, remove 3.