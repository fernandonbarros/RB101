def diamond(size)
  half_arr = []
  (size / 2).times { |i| half_arr << ('*' * (1 + i*2)).center(size) }
  puts (half_arr + ['*' * size] + half_arr.reverse)
end

diamond(1)
diamond(3)
diamond(9)
