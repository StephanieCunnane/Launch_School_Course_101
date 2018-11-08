def determine_century(year)
  return 'Please enter an integer year greater than 0.' if year <= 0
  return '1st' if year <= 100

  century_num = year.to_s.slice(0..-3)
  century_num = century_num.next if year.to_s.slice(-2..-1) != '00'

  last_digits = century_num.size > 1 ? century_num[-2..-1] : century_num
  suffix = if %w(11 12 13).include?(last_digits)
             'th'
           else
             case last_digits[-1]
             when '1' then 'st'
             when '2' then 'nd'
             when '3' then 'rd'
             else 'th'
             end
           end

  "#{century_num}#{suffix}"
end

p determine_century(-4) == 'Please enter an integer year greater than 0.'
p determine_century(2000) == '20th'
p determine_century(2001) == '21st'
p determine_century(1965) == '20th'
p determine_century(256) == '3rd'
p determine_century(5) == '1st'
p determine_century(10103) == '102nd'
p determine_century(1052) == '11th'
p determine_century(1127) == '12th'
p determine_century(11201) == '113th'

# Given solution
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end