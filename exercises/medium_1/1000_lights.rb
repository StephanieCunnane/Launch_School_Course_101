def lights(switch_count)
  row_of_switches = [false] * switch_count
  multiplier = 1
  
  switch_count.times do
    row_of_switches.each_index do |idx| 
      row_of_switches[idx] = !row_of_switches[idx] if (idx + 1) % multiplier == 0 
    end
    multiplier += 1
  end

  hsh = (1..switch_count).to_a.zip(row_of_switches).to_h
  hsh.select { |_k, v| v == true }.keys
end

p lights(10)

# Given solution
def initialize_lights(number_of_lights)
  lights = {}
  (1..number_of_lights).each { |num| lights[num] = "off" }
  lights
end

def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end
  
  on_lights(lights)
end

p toggle_lights(10)

