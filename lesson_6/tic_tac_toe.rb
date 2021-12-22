require "pry"
BLANK_MARKER = ' '
PLAYER_MARKER = 'X'
CPU_MARKER = 'O'
WINNING_SCORE = 2

def prompt(message)
  puts ">> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  blank = " " * 5 + "|" + " " * 5 + "|" + " " * 5
  line = "-" * 5 + "|" + "-" * 5 + "|" + "-" * 5

  system 'clear'
  prompt "You are #{PLAYER_MARKER}, computer is #{CPU_MARKER}"
  puts blank
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts blank
  puts line
  puts blank
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts blank
  puts line
  puts blank
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts blank
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = BLANK_MARKER }
  new_board
end

def joinor(arr, delimiter = ', ', last_delimiter = ', or')
  str = if arr.size > 1
          "#{arr[0...-1].join(delimiter)} #{last_delimiter} #{arr.last}"
        else
          arr.first.to_s
        end

  str
end

def player_places_piece!(board)
  user_move = get_user_move(board)
  board[user_move] = PLAYER_MARKER
end

def get_user_move(board)
  move = 0
  loop do
    prompt "Choose an empty square? (#{joinor(empty_squares(board))})"
    move = gets.chomp.to_i
    break if valid_move(board, move)
    prompt "Invalid move, try again!"
  end
  move
end

def empty_squares(board)
  board.keys.select { |symbol| board[symbol] == BLANK_MARKER }
end

def valid_move(board, move)
  empty_squares(board).include?(move)
end

def immediate_threat?(board, attack_marker = PLAYER_MARKER,
                      defense_marker = CPU_MARKER)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  next_pos = nil

  winning_lines.each do |line|
    threat_count = 0
    line.each do |pos|
      threat_count += 1 if board[pos] == attack_marker
      threat_count -= 1 if board[pos] == defense_marker
      next_pos = pos if board[pos] == BLANK_MARKER
    end
    threat_count < 2 ? next_pos = nil : break
  end
  next_pos
end

def computer_places_piece!(board)
  computer_move = immediate_threat?(board, attack_marker = CPU_MARKER,
                                    defense_marker = PLAYER_MARKER)
  computer_move = immediate_threat?(board) if !computer_move
  computer_move = 5 if !computer_move && empty_squares(board).include?(5)
  computer_move = empty_squares(board).sample if !computer_move
  board[computer_move] = CPU_MARKER
end

def place_piece!(board, player)
  player == 'C' ? computer_places_piece!(board) : player_places_piece!(board)
end

def tie?(board)
  empty_squares(board).empty?
end

def get_pieces(board, piece)
  board.keys.select { |pos| board[pos] == piece }
end

def winner?(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if line.all? { |pos| board[pos] == PLAYER_MARKER }
      return 1
    elsif line.all? { |pos| board[pos] == CPU_MARKER }
      return -1
    end
  end
  nil
end

def play_again?
  input = ''
  loop do
    prompt "Would you like to play again? (y/n)"
    input = gets.chomp.upcase

    break if 'YN'.include?(input)

    prompt "Invalid input!"
  end
  input
end

def who_goes_first?
  answer = ''

  loop do
    prompt "Who goes first? (P - player, C - computer)"
    answer = gets.chomp.upcase
    break if 'PC'.include?(answer)
    prompt "Invalid input!"
  end
  answer
end

def alternate_player(current_player)
  current_player == 'C' ? 'P' : 'C'
end

# Main game code
puts "Welcome to Tic Tac Toe!!"
score = { player: 0, cpu: 0 }

loop do
  # 1. Display the initial empty 3x3 board.
  board = initialize_board
  display_board(board)

  current_player = who_goes_first?
  winner = nil

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    winner = winner?(board)
    break if winner || tie?(board)
  end

  display_board(board)
  if winner
    if winner == 1
      prompt "The player wins the round!"
      score[:player] += 1
    elsif winner == -1
      prompt "The computer wins the round!"
      score[:cpu] += 1
    end
  end

  # 8. Play again?
  prompt "Score:"
  prompt "Player #{score[:player]} - CPU #{score[:cpu]}"
  if score[:player] == WINNING_SCORE
    prompt "Player won the game!"
    break
  elsif score[:cpu] == WINNING_SCORE
    prompt "Computer won the game!!"
    break
  end

  # 9. If yes, go to #1
  prompt "Next round!!!! (Press any key)"
  gets
end

# 10. Good bye!
prompt "Good bye!"
