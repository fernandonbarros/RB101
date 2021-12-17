arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

multiples_of_3 = arr.map do |arrays|
  arrays.select {|n| n % 3 == 0}
end

p multiples_of_3