require 'date'

def friday_13th(year)
  thirteenths = []
  (1..12).each { |month| thirteenths << Date.new(year, month, 13) }
  thirteenths.select(&:friday?).count
end

# Given solution
require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# Further Exploration
require 'date'

def count_five_friday_months(year)
  fridays = []
  months_counts = []
  five_friday_months = 0

  (Date.new(year, 1, 1)..Date.new(year, 12, 31)).each do |date|
    fridays << date if date.friday?
  end

  fridays.each { |friday| months_counts << friday.month }

  (1..12).each do |month|
    five_friday_months += 1 if months_counts.count(month) == 5
  end

  five_friday_months
end

puts count_five_friday_months(2019) # should return 4
puts count_five_friday_months(2000) # should return 4

