# Input: a string and a positive integer
# Output: the given string printed the given integer times

def repeat(str, repetitions)
  repetitions.times { puts str }
end

repeat("Hello", 3)
repeat("", 3)
repeat("Hello", 0)