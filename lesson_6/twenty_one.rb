require "pry"

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or stay
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner

def prompt(msg)
  puts ">> #{msg}"
end

def initialize_deck
  ((['ace', 'jack', 'queen', 'king'] + (2..10).to_a) * 4).shuffle
end

def deal(deck)
  player_cards = []
  dealer_cards = []

  2.times do |_|
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
  return player_cards, dealer_cards
end

# rubocop:disable Layout/LineLength
def display_cards(cards, player_name = 'Player', all_cards = true)
  if all_cards
    player_string = cards.join(', ')
    prompt "#{player_name} has #{player_string} (#{cards_total(cards)})"
  else
    prompt "#{player_name} has #{cards.first} and #{cards.length - 1} unknown card(s)"
  end
end
# rubocop:enable Layout/LineLength

def player_turn!(deck, player_cards, dealer_cards)
  until bust?(player_cards)
    system 'clear'
    prompt "Player's turn:"
    display_cards(dealer_cards, 'Dealer', false)
    display_cards(player_cards)
    prompt "Would you like to hit or stay? (1 - hit; 2 - stay)"
    choice = gets.chomp

    if choice == '1'
      player_cards << deck.pop
    elsif choice == '2'
      break
    else
      prompt "Invalid choice!!"
    end
  end
end

def bust?(cards)
  cards_total(cards) > 21
end

def cards_total(cards)
  total = 0
  cards.each { |card| total += card_value(card) }

  cards.count('ace').times do |_|
    break if total <= 21
    total -= 10
  end

  total
end

def card_value(card)
  ['ace', 'jack', 'queen', 'king'].include?(card) ? 11 : card
end

def dealer_turn!(deck, dealer_cards, player_cards)
  loop do
    system 'clear'
    prompt "Dealer's turn:"
    display_cards(player_cards)
    display_cards(dealer_cards, 'Dealer')
    if cards_total(dealer_cards) >= 17
      prompt "Dealer stayed!"
      break
    end
    dealer_cards << deck.pop
    prompt "Dealer hit: #{dealer_cards.last}"

    break if bust?(dealer_cards)
    gets.chomp
  end
end

def game_result?(player_cards, dealer_cards)
  player_total = cards_total(player_cards)
  dealer_total = cards_total(dealer_cards)

  if bust?(player_cards) || dealer_total > player_total && !bust?(dealer_cards)
    'dealer'
  elsif bust?(dealer_cards) || player_total > dealer_total
    'player'
  else
    'tie'
  end
end

def display_game_result(result)
  if result == 'tie'
    prompt "It's a tie!"
  else
    prompt "#{result.capitalize} won!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Would you like to play again? (y/n)"
    answer = gets.chomp.upcase
    break if 'YN'.include?(answer)
    prompt "Invlid entry!"
  end

  answer == 'Y'
end

# tests
def tests
  test_total
end

def test_total
  result = true
  result &&= cards_total([1, 2]) == 3
  result &&= cards_total([10, 10, 1]) == 21
  result &&= cards_total([10, 2, 'ace']) == 13
  result &&= cards_total(['ace', 10]) == 21

  puts "test_total passes? #{result}"
end

# main game loop
loop do
  deck = initialize_deck
  player_cards, dealer_cards = deal(deck)
  player_turn!(deck, player_cards, dealer_cards)
  dealer_turn!(deck, dealer_cards, player_cards) unless bust?(player_cards)
  result = game_result?(player_cards, dealer_cards)
  display_game_result(result)
  break unless play_again?
end

prompt "Thank you for playing twenty-one. Good bye!"
