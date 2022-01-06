def toggle(lights, pos)
  lights[pos] = (lights[pos] - 1).abs
end

def toggle_lights(n_lights)
  lights = [0] * n_lights
  n_lights.times do |i|
    pos_to_toggle = (i...n_lights).step(i+1).to_a
    pos_to_toggle.each {|pos| toggle(lights, pos)}
  end
  on_arr = []
  lights.each_with_index {|el, i| on_arr << i+1 if el == 1}
  on_arr
end

p toggle_lights(5)
p toggle_lights(10)