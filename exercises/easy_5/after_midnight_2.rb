MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(time_str)
  return 0 if time_str == '24:00'
  sum = 0
  sum += time_str[0..1].to_i * MINUTES_PER_HOUR
  sum += time_str[-2..-1].to_i
  sum
end

def before_midnight(time_str)
  return 0 if ['24:00', '00:00'].include?(time_str)
  MINUTES_PER_DAY - after_midnight(time_str)
end

# Refactored to use Ruby's Time class
def after_midnight(time_str)
  return 0 if time_str == '24:00'
  hours, minutes = time_str.split(':').map(&:to_i)
  midnight = Time.new(2018, 11, 19)
  given_time = Time.new(2018, 11, 19, hours, minutes)
  ((given_time - midnight) / MINUTES_PER_HOUR).to_i
end

def before_midnight(time_str)
  return 0 if ['24:00', '00:00'].include?(time_str)
  MINUTES_PER_DAY - after_midnight(time_str)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
