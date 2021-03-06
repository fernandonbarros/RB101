def featured(n)
  n.even? ? n += 1 : n += 2
  n += 2 until n % 7 == 0

  until n >= 10**10
    n_chars = n.to_s.chars
    return n if n_chars.uniq == n_chars
    n += 14
  end
  puts "There is no possible number that fulfills those requirements."
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
