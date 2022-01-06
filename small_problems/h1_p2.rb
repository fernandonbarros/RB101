# 8 pointed star in n x n grid
# smallest start 7x7

# Input: n - integer representing grid size
# Output: 8 pointed star
# Returns: nil

def star(n)
  # Generate bottom half
  half_size = n / 2
  bottom_half_star = []
  half_size.times do |spaces|
    bottom_half_star << "*#{" " * spaces}*#{" " * spaces}*".center(n)
  end

  # Generate center
  center = ['*' * n]

  # Construct star
  output = bottom_half_star.reverse + center + bottom_half_star
  puts output
end

star(7)
puts
puts
star(9)