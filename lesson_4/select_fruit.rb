def select_fruit(produce)
  counter = 0
  fruits = {}

  loop do
    item = produce.keys[counter]
    fruits[item] = produce[item] if produce[item] == 'Fruit'
    counter += 1

    break if counter >= produce.length
  end
  
  return fruits
end

  
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}