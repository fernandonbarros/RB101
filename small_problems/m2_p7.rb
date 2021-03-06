require 'date'

def friday_13th(year)
  count = 0
  t = Date.civil(year, 1, 13)
  12.times do
    count += 1 if t.friday?
    t = t.next_month
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
