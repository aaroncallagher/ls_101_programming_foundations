numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# You would expect 'puts numbers' to display 
# 1
# 2
# 2
# 3
# because the uniq method does not mutate the caller and the puts method prints
#  the display in string form