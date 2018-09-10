# Input: none
# Output: a string representation of each even number 1 to 99 inclusive,
#         each on a separate line

(1..99).each { |num| puts num if num.even? }

puts (1..99).select { |num| num.even? }

1.upto(99) { |num| puts num if num.even? }

puts (1..99).select(&:even?)
