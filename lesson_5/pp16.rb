def generate_UUID
  hex_chars = ('0'..'9').to_a + ('a'..'f').to_a
  uuid = ""
  32.times {|_| uuid << hex_chars.sample}
  uuid.insert(8, '-').insert(12, '-').insert(16, '-').insert(20, '-')
end

puts generate_UUID
