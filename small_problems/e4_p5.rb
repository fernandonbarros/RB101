def multisum(number)
  total = 0
  (1..number).each { |n| total += n if (n % 3 == 0 || n % 5 == 0)}
  total
end

def multisum(number)
  (1..number).reduce(0) {|total, n| (n % 3 == 0 || n % 5 == 0) ? total + n : total}
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168