def stringy(number)
  str = ''
  number.times {|n| str << ((n+1) % 2).to_s}
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'