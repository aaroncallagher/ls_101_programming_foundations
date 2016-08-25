VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Its a tie")
  end
end

def display_valid_choices(arr)
  arr.each do |word|
    if word[0] == 's'
      # Two choices begin with s, so it displays first two letters instead of 1.
      prompt("#{word[0..1]} for #{word}")
    else
      prompt("#{word[0]} for #{word}")
    end
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one:")
    display_valid_choices(VALID_CHOICES)
    choice = case Kernel.gets().chomp()
             when 'r'
               choice = 'rock'
             when 'p'
               choice = 'paper'
             when 'sc'
               choice = 'scissors'
             when 'sp'
               choice = 'spock'
             when 'l'
               choice = 'lizard'
             end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Thats not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; The computer chose #{computer_choice}")

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  display_results(choice, computer_choice)
  prompt("You: #{player_score} || Computer #{computer_score}")
  sleep(1)
  if player_score == 5
    prompt("****YOU WIN!!!!****")
    break
  elsif computer_score == 5
    prompt("The computer won :( Better luck next time")
    break
  end
end

prompt("Thank you for playing #{VALID_CHOICES.join(', ')}")
