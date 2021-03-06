def letter_counts(str)
  counts = {}
  counts[:lowercase] = str.count('a-z')
  counts[:uppercase] = str.count('A-Z')
  counts[:neither] = str.count('^a-zA-Z')
  counts
end

def calculate_percentage(count, length)
  count.fdiv(length) * 100
end

def letter_percentages(str)
  length = str.size
  percentages = letter_counts(str) 
  percentages[:lowercase] = calculate_percentage(percentages[:lowercase], length)
  percentages[:uppercase] = calculate_percentage(percentages[:uppercase], length)
  percentages[:neither] = calculate_percentage(percentages[:neither], length)
  percentages 
end

# Additional solution
def letter_percentages(str)
  total_chars = str.size
  lowercase = str.scan(/[a-z]/).count
  uppercase = str.scan(/[A-Z]/).count
  neither = total_chars - (lowercase + uppercase)
  
  percentages = {}
  percentages[:lowercase] = lowercase.fdiv(total_chars) * 100
  percentages[:uppercase] = uppercase.fdiv(total_chars) * 100
  percentages[:neither] = neither.fdiv(total_chars) * 100
  percentages
end

# Refactoring
def calculate_percentages(count, total)
  (count.fdiv(total) * 100).round(2)
end

def letter_percentages(str)
  total_chars = str.size
  lowercase = str.scan(/[a-z]/).count
  uppercase = str.scan(/[A-Z]/).count
  neither = total_chars - (lowercase + uppercase)
  
  percentages = {}
  percentages[:lowercase] = calculate_percentages(lowercase, total_chars)
  percentages[:uppercase] = calculate_percentages(uppercase, total_chars)
  percentages[:neither] = calculate_percentages(neither, total_chars)
  percentages
end

# Given solution
def calculate(percentages, counts, length)
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

def letter_percentages(str)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = str.chars
  length = str.size
  
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/}
  
  calculate(percentages, counts, length)
  
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

