############################################################
# 1

# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

result = arr.sort do |a, b|
           b.to_i <=> a.to_i
         end

p result

############################################################
# 2

# How would you order this array of hashes based on the year of
# publication of each book, from the earliest to the latest?
books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

p books.sort_by { |book| book[:published] }

############################################################
# 3

# How you would reference the letter 'g' in each collection?
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]

############################################################
# 4

# For each of these collection objects where the value 3 occurs,
# demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

############################################################
# 5

# Figure out the total age of just the male members of the family
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

male_munsters = munsters.select { |_k, v| v['gender'] == 'male' }

total_male_ages = 0

male_munsters.each { |_k, v| total_male_ages += v['age'] }

puts "Total male age is: #{total_male_ages}"

# Or

total_male_ages = 0

munsters.each_value do |details|
  total_male_ages += details['age'] if details['gender'] == 'male'
end

puts "Total male age is: #{total_male_ages}"

############################################################
# 6

# Print out the name, age and gender of each family member
# using string substitution and this hard-coded string:
# (Name) is a (age)-year-old (male or female).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

info_template = "(Name) is a (age)-year-old (male or female)."

munsters.each do |name, details|
  puts info_template.sub("(Name)", name)
                    .sub("(age)", details["age"].to_s)
                    .sub("(male or female)", details["gender"])
end

############################################################
# 7

# Given this code, what would be the final values of a and b?
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a
p b

# a => 2
# b => [3, 8]

############################################################
# 8

# Using the each method, write some code to output all of the vowels from
# the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.values.flatten.join.each_char do |char|
  puts char if vowels.include?(char)
end

# or

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

############################################################
# 9

# Return a new array of the same structure but with the sub arrays being ordered
# (alphabetically or numerically as appropriate) in descending order

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

result = arr.map do |sub_arr|
           sub_arr.sort { |a, b| b <=> a }
         end

############################################################
# 10

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

result = arr.map do |hsh|
  keys = hsh.keys
  values = hsh.values.map(&:next)
  keys.zip(values).to_h
end

puts "result:"
p result
puts "original array:"
p arr

# Or
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr.map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

############################################################
# 11

# Return a new array identical in structure to the original but containing
# only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

result = arr.map do |sub_arr|
  sub_arr.select { |num| num % 3 == 0 }
end

p result

############################################################
# 12

# Without using the Array#to_h method, write some code that will return a hash
# where the key is the first item in each sub array and the value is the
# second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

p Hash[arr]

# Or

hsh = {}
arr.each do |element|
  hsh[element.first] = element.last
end

p hsh

############################################################
# 13

# Return a new array containing the same sub-arrays as the original but ordered
# logically according to the numeric value of the odd integers they contain.
# Output: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

result = arr.sort_by do |sub_arr|
  sub_arr.select(&:odd?)
end

p result
