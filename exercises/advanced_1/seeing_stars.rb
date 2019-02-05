STAR = '*'
SPACE = ' '

def initialize_grid(size)
  grid = []
  row = (SPACE * size).chars
  # Use #dup so that each row isn't comprised of references to the exact same objects
  size.times { grid << row.dup }
  grid
end

def update_grid(grid)
  midpoint = grid.size / 2

  # center row
  center_row = grid[midpoint]
  center_row.each_index { |square| center_row[square] = STAR }

  # center column
  grid.each { |row| row[midpoint] = STAR }

  # descending diagonal
  0.upto(grid.size - 1) { |idx| grid[idx][idx] = STAR }

  # ascending diagonal
  grid.each_index do |column_idx|
    row_idx = (grid.size - 1) - column_idx
    grid[row_idx][column_idx] = STAR
  end

  grid
end

def print_grid(grid)
  grid.each { |row| puts row.join }
end

grid = initialize_grid(11)
update_grid(grid)
print_grid(grid)

# Given solution
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

star(7)
puts
star(11)
