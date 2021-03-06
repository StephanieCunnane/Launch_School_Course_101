MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE
DEGREE = "\xC2\xB0"

def dms(angle_measurement)
  full_degrees, remainder = angle_measurement.divmod(1)
  minutes, remainder = (remainder * MINUTES_PER_DEGREE).divmod(1)
  seconds = remainder * SECONDS_PER_MINUTE
  full_degrees.to_s + DEGREE + format("%02d", minutes) + "'" + format("%02d", seconds) + "\""
end

# given solution
def dms(angle_measurement)
  total_seconds = angle_measurement * SECONDS_PER_DEGREE
  degrees, remainder = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remainder.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
