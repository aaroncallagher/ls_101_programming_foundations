advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice!(0, advice.index('house'))
puts advice

# BONUS 
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice(0, advice.index('house'))
puts advice

# advice.slice() does NOT mutate the caller, therefore, the original copy of
# advice remains the full string.