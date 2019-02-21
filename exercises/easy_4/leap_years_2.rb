def leap_year?(year)
  return year % 4 == 0 if year < 1752
  if year % 4 == 0
    return true if year % 100 != 0
    return true if year % 400 == 0
  end
  false
end

def leap_year?(year)
  return year % 4 == 0 if year < 1752
  return true if year % 400 == 0
  return true if year % 4 == 0 && year % 100 != 0
  false
end

require 'date'

def leap_year?(year)
  return Date.julian_leap?(year) if year < 1752
  Date.leap?(year)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
