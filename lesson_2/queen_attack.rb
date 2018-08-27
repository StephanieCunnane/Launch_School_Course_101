# Input: a string representation of a chess board with 2 queens
# Output: a boolean indicating whether the 2 queens can attack one another

# Parse the string to get the coordinates of the two queens
# The coordinates: 2 arrays of 2 integers each
# Doesn't matter which queen is which, we only care that a queen is there

# 2 functions
  # get_coordinates(chess_board) => [int, int, int, int]
  # queens_can_attack?(queen1_pos, queen2_pos) => Boolean

# Questions:
# How do we parse the string into arrays of coordinates?
  # - split on \n
  # ordered_coordinates = []
  # - nested loop:
    # outer loop: iterate through each row (block parameter - i)
    # inner loop: iterate through each column (block parameter - j)
      # when char != '_', ordered_coordinates << i << j
      # return ordered_coordinates
      # queen1_pos = ordered_coordinates[0..1]
      # queen2_pos = ordered_coordinates[2..3]

# Then determine:
  # How do we know it's the same row?
  # How do we know it's the same column?
  # How do we know it's the same diagonal?


CHESS_BOARD = "_ _ _ _ _ _ _ _
               _ _ _ _ _ _ _ _
               _ _ _ W _ _ _ _
               _ _ _ _ _ _ _ _
               _ _ _ _ _ _ _ _
               _ _ _ _ _ _ B _
               _ _ _ _ _ _ _ _
               _ _ _ _ _ _ _ _"

def get_coordinates(chess_board)
  chess_board = chess_board.lines.map { |line| line.delete(' ') }
  ordered_coordinates = []

  chess_board.each_with_index do |row, i|
    row.chars.each_with_index do |column, j|
      ordered_coordinates << i << j if %w(w b W B).include?(column)
    end
  end

  ordered_coordinates
end

def queens_can_attack?(pos1, pos2)
  return true if pos1[0] == pos2[0] || pos1[1] == pos2[1]
  row_difference = pos1[0] - pos2[0]
  column_difference = pos1[1] - pos2[1]
  row_difference == column_difference
end

queen1_pos =  get_coordinates(CHESS_BOARD)[0..1]
queen2_pos =  get_coordinates(CHESS_BOARD)[2..3]

puts queens_can_attack?(queen1_pos, queen2_pos)
