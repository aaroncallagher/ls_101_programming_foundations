def tricky_method_new(a_string_param, an_array_param)
  a_string_param += " rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param #explicitly return both parameters
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method_new(my_string, my_array) #save this to a var

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"