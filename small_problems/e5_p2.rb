def time_of_day(minutes_from_midnight)
  hours =  (minutes_from_midnight / 60) % 24
  minutes = minutes_from_midnight % 60

  if minutes < 0
    hours -= 1
    minutes += 60
  end

  hours += 24 if hours < 0
  
  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
end
  
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"