def rotate_rightmost_digits(num, n_rotations)
  str = num.to_s
  to_rotate = str[-n_rotations..-1]
  rotated = to_rotate[1..-1] + to_rotate[0..0]
  (str[0...-n_rotations] + rotated).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917