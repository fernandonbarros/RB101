def count_occurrences(list)
  occurences = list.each_with_object({}) do |el, hsh|
    if hsh.include?(el.downcase)
      hsh[el.downcase] += 1
    else
      hsh[el.downcase] = 1
    end
  end

  occurences.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)