if false
  greeting = “hello world”
end

greeting

# You will get nil. I expected to get an undefined local variable error, but
#  Im expecting something like, the variable gets initialized even if its branch 
#  of the if/else block doesnt execute.
