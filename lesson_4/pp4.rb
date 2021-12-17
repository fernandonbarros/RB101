ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min

min_age = 99999
ages.each {|_, age| min_age = age if age < min_age}

puts min_age