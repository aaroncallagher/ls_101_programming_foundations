advice = "Few things in life are as important as house training your pet dinosaur."

advice_arr = advice.split()
advice_arr[6] = "urgent"

advice = advice_arr.join(' ')
p advice

# Or, much easier, as I realized after, but it illustrates there are more than
#  one way to solve a problem

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')
p advice