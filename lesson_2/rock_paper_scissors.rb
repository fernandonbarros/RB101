VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  sc: 'scissors',
                  sp: 'spock',
                  l: 'lizard' }

WINNING_COMBOS = { rock: %w(scissors lizard),
                   paper: %w(rock spock),
                   scissors: %w(paper lizard),
                   spock: %w(rock scissors),
                   lizard: %w(spock paper) }

def prompt(message)
  puts ">> #{message}"
end

def win?(player1, player2)
  WINNING_COMBOS[player1.to_sym].include?(player2)
end

def who_won?(player, computer)
  if win?(player, computer)
    :player
  elsif win?(computer, player)
    :computer
  else
    :tie
  end
end

def display_result(result)
  round_messages = {
    player: 'You won, computer lost.',
    computer: 'You lost, computer won.',
    tie: "It's a tie!"
  }

  prompt round_messages[result]
end

prompt("Welcome to #{VALID_CHOICES.values.join(', ')}!")
prompt('The first player to reach three points wins')

score = { player: 0,
          computer: 0 }
until score.max[1] == 3
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.values.join(', ')} \
    (#{VALID_CHOICES.keys.join(', ')})")
    choice = gets.chomp.downcase
    choice =  VALID_CHOICES[choice.to_sym] if \
              VALID_CHOICES.keys.include?(choice.to_sym)
    break if VALID_CHOICES.values.include?(choice)
    prompt('Invalid choice.')
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose #{choice}; Computer chose: #{computer_choice}")

  winner = who_won?(choice, computer_choice)
  display_result(winner)
  score[winner] += 1 unless winner == :tie
end

prompt("#{score.max[0].capitalize} won!")

prompt('Thank you for playing, goodbye!')
