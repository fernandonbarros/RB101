def bubble_sort!(arr)
  swapped = true
  arr_length = arr.length
  pass = 0
  until !swapped
    swapped = false
    pass += 1
    (arr_length - pass).times do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i] 
        swapped = true
      end
    end
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)