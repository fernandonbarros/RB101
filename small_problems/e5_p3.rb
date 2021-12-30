def after_midnight(time_str)
  hour_str, min_str = time_str.split(':')
  total_minutes = min_str.to_i
  total_minutes += hour_str.to_i * 60

  total_minutes % 1440
end

def before_midnight(time_str)
  hour_str, min_str = time_str.split(':')
  total_minutes = min_str.to_i
  total_minutes += hour_str.to_i * 60

  (1440 - total_minutes % 1440) % 1440
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0