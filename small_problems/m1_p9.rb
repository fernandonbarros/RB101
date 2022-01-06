def fibonacci(num)
  if num == 1
    1
  else
    fib_2 = 0
    fib_1 = 1
    (num-1).times do |_|
      fib_2, fib_1 = fib_1, fib_1 + fib_2
    end
    fib_1
  end
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075