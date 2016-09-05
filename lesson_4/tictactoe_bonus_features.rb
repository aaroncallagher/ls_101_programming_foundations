require 'pry'

GO_FIRST = 'choose'.freeze

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts"=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that is an invalid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_ai_moves(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2 &&
     brd.values_at(*line).count(INITIAL_MARKER) == 1
    line[brd.values_at(*line).index(INITIAL_MARKER)]
  end
end

def computer_places_piece!(brd)
  square = nil
  # Attack to win
  WINNING_LINES.each do |line|
    square = computer_ai_moves(line, brd, COMPUTER_MARKER)
    break if square
  end
  # Defend against imminent loss
  WINNING_LINES.each do |line|
    square ||= computer_ai_moves(line, brd, PLAYER_MARKER)
    break if square
  end
  # Use Middle Square
  square ||= 5 if brd[5] == INITIAL_MARKER
  # select random if none available
  square ||= empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == 'you'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == "you"
    "computer"
  else
    "you"
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def display_score(player_score, computer_score)
  prompt("You: #{player_score} || Computer: #{computer_score}")
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'You'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(choices, punctuation = ',', conjunction = 'or')
  str = ""
  choices.each_with_index do |choice, index|
    if choices.length == 1
      str = choice
    elsif index == (choices.length - 1)
      str += conjunction.to_s + " " + choice.to_s
    else
      str += choice.to_s + punctuation.to_s + " "
    end
  end
  str
end

player_victories = 0
computer_victories = 0

loop do
  board = initialize_board
  if GO_FIRST == "choose"
    player = ''
    loop do
      prompt "Who will start the Game? (You or Computer):"
      player = gets.chomp.downcase
      break if %w(you computer).include?(player)
      prompt "Invalid choice."
    end
  else
    player = GO_FIRST
  end

  loop do
    display_board(board)
    place_piece!(board, player)
    display_board(board)
    player = alternate_player(player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
    if detect_winner(board) == 'You'
      player_victories += 1
    else
      computer_victories += 1
    end
  else
    prompt("Cat's Game!")
  end

  display_score(player_victories, computer_victories)
  if player_victories == 5
    prompt("****YOU WIN!!!!****")
    break
  elsif computer_victories == 5
    prompt("The computer won :( Better luck next time")
    break
  end
end

prompt("Thanks for playing Tic-Tac-Toe. Good-Bye")
