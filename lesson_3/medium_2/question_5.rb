answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# Output will be 34, because answer is used as a parameter, so, creates a new 
# scope and original variable is not affected. 