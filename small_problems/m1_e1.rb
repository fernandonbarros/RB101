def rotate_array(arr)
  new_arr = arr.map { |x| x }
  new_arr << new_arr.shift
end

# After reviewing solution
def rotate_array(arr)
  arr[1..-1] + arr[0..0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true