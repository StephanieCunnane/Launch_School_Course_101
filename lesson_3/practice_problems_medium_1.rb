############################################################
# 1)

#  Write a one-line program that creates the following output 10 times,
# with the subsequent line indented 1 space to the right:
10.times { |n| puts 'The Flintstones Rock!'.rjust(n + 'The Flintstones Rock!'.length) }
# or
10.times { |n| puts "#{' ' * n}The Flintstones Rock!"}

############################################################
# 2)

# The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# => TypeError because we are trying to add an Integer to a String
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

############################################################
# 3)

def factors(number)
  return "Positive integer >= 1, please" if number < 1

  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# What is the purpose of the number % dividend == 0 ?
# To determine whether dividend will divide evenly into number

# What is the purpose of the second-to-last line in the method
# (the divisors before the method's end)?
# That's the value that's (implicitly) returned by the method


############################################################
# 4)

# How are these 2 implementations of a rolling buffer different?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Both have the same return values. But rolling_buffer1 is a destructive
# method, whereas rolling_buffer2 is not (it uses an extra data structure
# in the implementation).

############################################################
# 5)

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# => NameError (undefined local variable or method `limit')
# The method currently cannot access the local variable limit in the main scope

# Refactored:

limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

############################################################
# 6)

# How can we refactor this practice problem to make the result easier to
# predict and easier for the next programmer to maintain?

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Refactor so that both data structures are mutated
# or neither data structure is mutated.
# Refactored:

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

############################################################
# 7)

# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# => 34

############################################################
# 8)

# Does the family's data get ransacked? Why or why not?
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member['age'] += 42
    family_member['gender'] = 'other'
  end
end

mess_with_demographics(munsters)

# Yes, the data has been changed.
# Element assignment is destructive to the encapsulating collection,
# so the hash object_id stays the same and hash object itself is mutated.

############################################################
# 9)

def rps(fist1, fist2)
  if fist1 == 'rock'
    (fist2 == 'paper') ? 'paper' : 'rock'
  elsif fist1 == 'paper'
    (fist2 == 'scissors') ? 'scissors' : 'paper'
  else
    (fist2 == 'rock') ? 'rock' : 'scissors'
  end
end

puts rps('rock', 'rock')
# => 'rock'

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# => 'paper'

############################################################
# 10)

def foo(param = 'no')
  'yes'
end

def bar(param = 'no')
  (param == 'no') ? 'yes' : 'no'
end

bar(foo)
# bar('yes')
# => 'no'

