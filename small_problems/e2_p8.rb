def prompt(msg)
  puts ">> #{msg}"
end

prompt "Please enter an integer greater than 0:"
int = gets.chomp.to_i

prompt "Enter 's' to compute the sum, 'p' to compute the product."
choice = ''
loop do
  choice = gets.chomp.downcase
  break if 'sp'.include?(choice)
  prompt "Invalid choice, try again!"
end

if choice == 's'
  puts "The sum of the integers between 1 and #{int} is #{(1..int).sum}"
elsif choice == 'p'
  puts "The product of the integers between 1 and #{int} is #{(1..int).reduce(:*)}"
end
