original = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = original.map do |hash|
  hash.transform_values {|value| value + 1}
end

p original
p new_arr