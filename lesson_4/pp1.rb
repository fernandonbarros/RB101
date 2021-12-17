flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index {|value, index| flintstones_hash[value] = index}

puts flintstones_hash