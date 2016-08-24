greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# The result of puts greeting would be the hash { a: 'hi there' }, because 
# informal_greeting is a reference to the original greeting object. So, when 
# appending 'there', it affects the original object is is referncing.