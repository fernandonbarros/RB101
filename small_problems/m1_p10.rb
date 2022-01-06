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

def fibonacci_last(num)
  fibonacci(num).to_s[-1].to_i
end

def fibonacci_last(num)
  last_2 = [1, 1]
  3.upto(num) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

10.times {|n| p fibonacci_last(n+1)}
