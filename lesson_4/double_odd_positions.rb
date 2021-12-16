def double_odd_positions(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.length

    doubled_numbers << (counter.odd? ? 2 * numbers[counter]: numbers[counter])
    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_positions(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]