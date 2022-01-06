def triangle(a1, a2, a3)
  angles = [a1, a2, a3]

  if angles.any? {|a| a <= 0} || angles.sum != 180
    return :invalid
  elsif angles.include?(90)
    return :right
  elsif angles.all? {|a| a < 90}
    return :acute
  else
    return :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid