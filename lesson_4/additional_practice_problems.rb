############################################################
# 1)

# Turn this array into a hash where the names are the keys and the values
# are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

############################################################
# 2)

# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum

############################################################
# 3)

# Throw out the really old people (age 100 or older)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.reject { |_, age| age >= 100 }

############################################################
# 4)

# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

############################################################
# 5)

# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  break index if name.start_with?("Be")
end

############################################################
# 6)

# Amend this array so that the names are all shortened to just the
# first three characters
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map { |name| name[0..2] }

############################################################
# 7)

# Create a hash that expresses the frequency with which each letter
# occurs in this string:
statement = "The Flintstones Rock"
letter_frequencies = {}

statement.delete(' ').each_char do |char|
  if letter_frequencies[char]
    letter_frequencies[char] += 1
  else
    letter_frequencies[char] = 1
  end
end

############################################################
# 8)

numbers = [1, 2, 3, 4]

numbers.each do |number|
  p number
  numbers.shift(1)
end

1
3
# => [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

1
2
# => [1, 2]

############################################################
# 9)

# Write your own version of the Rails titleize implementation
words = "the flintstones rock"

titlized = words.split.each { |word| word.capitalize! }.join(' ')
# Or
titlized = words.split.map { |word| word.capitalize }.join(' ')

p titlized

############################################################
# 10)

# Programmatically modify the hash such that each member of the
# Munster family has an additional "age_group" key
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_munster, info_hash|
  info_hash["age_group"] = case
                           when info_hash['age'].between?(0, 17) then "kid"
                           when info_hash['age'].between?(18, 64) then "adult"
                           else "senior"
                           end
end

