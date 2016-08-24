def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# This program will output:
#  My string looks like this now: pumpkins
#  My array looks like this now: ["pumpkins", "rutabaga"]

# The reason for this is that strings are immutable, and inside the method it
# creates a new string object. This is basically forgotten inside this inner
# method scope. Thats why it prints "pumpkins"

# As far as the array, appending items to the array does NOT create a new array
# object. Thats why it prints ["pumpkins", "rutabaga"]