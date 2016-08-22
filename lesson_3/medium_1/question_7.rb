# limit = 15

# def fib(first_num, second_num)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# The problem here is that method definitions do not have access to outside 
#  local variables. They create their own, insular scope. The way to fix this
#  would be to either add limit as a parameter and pass in 15 in the method call
#  or to declare the variable inside the scope of the method. For flexibility
#  purposes, I will add limit as a parameter.

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"