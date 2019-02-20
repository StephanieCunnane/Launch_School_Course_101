def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power_of_n(num, exponent)
  return 1 if exponent == 0
  return num if exponent == 1

  repetitions = exponent - 1
  total = num
  loop do
    total = multiply(total, num)
    repetitions -= 1
    break if repetitions == 0
  end
  total
end

def calculate_power(base, exponent)
  accumulator = 1
  exponent.times { accumulator = multiply(accumulator, base) }
  accumulator
end

p square(5) == 25
p square(-8) == 64

p power_of_n(3, 5) == 243
p power_of_n(5, 5) == 3125
p power_of_n(2, 6) == 64
p power_of_n(2, 1) == 2
p power_of_n(2, 0) == 1

p calculate_power(5, 3) == 125
p calculate_power(5, 4) == 625

