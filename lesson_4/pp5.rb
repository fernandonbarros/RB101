flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

first_index = flintstones.index {|name| name[0..1] == 'Be'}

puts first_index