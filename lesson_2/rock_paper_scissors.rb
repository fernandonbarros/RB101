VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts ">> #{message}"
end

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won, computer lost.')
  elsif win?(computer, player)
    prompt('You lost, computer won.')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    prompt('Invalid choice.')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp

  break unless answer.downcase == 'y'
end

prompt('Thank you for playing, goodbye!')
