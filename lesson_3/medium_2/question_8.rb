def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)

# This will output no, because calling foo returns "yes", then when this is 
#  passed into the bar method, it checks to see if the parameter is "no", 
#  because this evaluates to false, it will return "no"