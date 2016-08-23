def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# This returns paper. Evaluate the two innermost will get you rps("paper, rock")
# Then, you'll evaluate that, to paper, which will leave you with 
# rps("paper", "rock") again, which returns paper. 
