# Well, I think this might be a trick question. In method naming conventions,
# a "!" usually denotes that the method will mutate the caller. 
# a "?" usually denotes that the method will check to see if a condition is true
#  or false
# But, those are part of method definitions and purely sytlistic & by convention
# not actually a part of Ruby syntax
# As far as actual Ruby syntax, the "!" means not,
# and the "?" is the ternary operator (alternate if/else)

# EXPLAIN WHAT WOULD HAPPEN IN THE FOLLOWING SCENARIOS:

# 1.) what is != and where should you use it?
#       != is the "not equal" logical operator and should be used to evaluate
#       expressions to true or false

# 2.) put ! before something, like !user_name
#       If you put an ! before something, it means not. So, in this example, it
#       would mean something like "if its not a user_name" do this...

# 3.) put ! after something, like words.uniq!
#       If you put an exclamation point after a method definition it usually
#       denotes that the method is destructive, but this is stylistic not syntax

# 4.) put ? before something
#       A conditional expression for the ternary operator, if condition is true,
#        expression to left of colon following ? is the value, if false, the
#        value on the right side of the colon is the value. 

# 5.) put ? after something
#      If you put a question mark after a method def, it usually denotes its
#      looking to see if the parameter passed in is true or false. This is
#      stylistic, not a syntactical concern.

# 6.) put !! before something, like !!user_name
#      Turns object into its boolean equiv. 