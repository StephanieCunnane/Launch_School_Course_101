MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
SECONDS_PER_MINUTE = 60

def time_of_day(offset)
  offset %= MINUTES_PER_DAY
  hours, minutes = offset.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# or

def time_of_day(offset)
  midnight = Time.new(2018, 11, 19)
  offset_in_seconds = offset * SECONDS_PER_MINUTE
  (midnight + offset_in_seconds).strftime("%H:%M")
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


def time_of_day(offset)
  # needs to be midnight on a Sunday for the offset to be correct
  sunday_at_midnight = Time.new(2018, 11, 18)
  offset_in_seconds = offset * SECONDS_PER_MINUTE
  (sunday_at_midnight + offset_in_seconds).strftime("%A %H:%M")
end

p time_of_day(-4231) == "Thursday 01:29"