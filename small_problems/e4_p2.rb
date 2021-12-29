def century(year)
  century_number = (year - 1) / 100 + 1
  last_digit = century_number % 10
  last_two_digits = century_number % 100
  ordinal = if [11, 12, 13].include?(last_two_digits)
              'th'
            elsif last_digit == 1
              'st'
            elsif last_digit == 2
              'nd'
            elsif last_digit == 3
              'rd'
            else
              'th'
            end
  "#{century_number}#{ordinal}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'