def transpose(matrix)
  result = []
  (0..2).each do |column_idx|
    new_row = (0..2).map { |row_idx| matrix[row_idx][column_idx] }
    result << new_row
  end
  result
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

