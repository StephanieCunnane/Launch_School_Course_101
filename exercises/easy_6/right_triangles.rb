def triangle(side_length)
  1.upto(side_length) do |num|
    puts ('*' * num).rjust(side_length)
  end
end

def upside_down_triangle(side_length)
  side_length.downto(1) do |num|
    puts ('*' * num).rjust(side_length)
  end
end

# Choose a right angle corner:
# 1 - top left, 2  - top right, 3 - bottom left, 4 - bottom right
# +------+
# |1    2|
# |      |
# |3    4|
# +------+
def choose_your_own_triangle(side_length, right_angle_corner=4)
  case right_angle_corner
  when 1
    side_length.downto(1) do |num|
      puts ('*' * num).ljust(side_length)
    end
  when 2
    side_length.downto(1) do |num|
      puts ('*' * num).rjust(side_length)
    end
  when 3
    1.upto(side_length) do |num|
      puts ('*' * num).ljust(side_length)
    end
  when 4
    1.upto(side_length) do |num|
      puts ('*' * num).rjust(side_length)
    end
  end
end

triangle(12)
puts '#######################'
upside_down_triangle(12)
puts '#######################'
choose_your_own_triangle(15, 2)

# given solution
def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end
