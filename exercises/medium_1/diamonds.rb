CHARACTER = '*'

def print_diamond(width)
  char_counts = ((1..width).to_a + (1...width).to_a.reverse).select(&:odd?)
  
  char_counts.each do |char_count|
    puts (CHARACTER * char_count).center(width)
  end
end

print_diamond(1)
print_diamond(9)

def print_hollow_diamond(width)
  char_counts = ((1..width).to_a + (1...width).to_a.reverse).select(&:odd?)
  
  char_counts.each do |char_count|
    results = ''
    
    results << if char_count == 1
                 CHARACTER
               else
                 "#{CHARACTER}#{' ' * (char_count - 2)}#{CHARACTER}"
               end
    
    puts results.center(width)
  end
end

print_hollow_diamond(1)
print_hollow_diamond(9)

def hollow_diamond(n)
  star_multipliers = [*1..n].concat((n - 1).downto(1).to_a).select(&:odd?)

  star_multipliers.each do |multiplier|
    if multiplier < 3
      star_str = ('*' * multiplier).center(n)
    else
      star_str = "*#{' ' * (multiplier - 2)}*".center(n)
    end
    puts star_str
  end
end

hollow_diamond(9)

# Given solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond(1)
diamond(9)
