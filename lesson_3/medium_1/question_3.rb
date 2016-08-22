# puts "the value of 40 + 2 is " + (40 + 2)

# TypeError trying to convert a FixNum into a String

# One way to fix is through String Interpolation
puts "the value of 40 + 2 is #{(40 + 2)}"

# The other way to fix is by calling the to_s method
puts "The value of 40 + 2 is " + (40 + 2).to_s