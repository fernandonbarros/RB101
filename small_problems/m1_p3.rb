def rotate_array(arr)
  arr[1..-1] + arr[0..0]
end

def max_rotation(num)
  arr = num.to_s.chars
  length = arr.length
  (length - 1).times do |i|
    arr = arr.slice(0, i) + rotate_array(arr.slice(i, length))
  end
  arr.join.to_i
end

# After reviewing solution
def rotate_rightmost_digits(num, n_rotations)
  str = num.to_s
  to_rotate = str[-n_rotations..-1]
  rotated = to_rotate[1..-1] + to_rotate[0..0]
  (str[0...-n_rotations] + rotated).to_i
end

def max_rotation(num)
  length = num.to_s.length
  length.downto(2) do |n_rotations|
    num = rotate_rightmost_digits(num, n_rotations)
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845