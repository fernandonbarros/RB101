arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

only_even = arr.select do |hsh|
  hsh.all? do |_, sub_arr|
    sub_arr.all? {|i| i.even?}
  end
end

p only_even