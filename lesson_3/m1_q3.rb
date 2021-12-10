def factors(number)
  factors = []
  number.times {|divisor| factors << number / (divisor+1) \
    if number % (divisor+1) == 0}

  return factors
end

p factors(10)