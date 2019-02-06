def transpose(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix[0].size
  (0...number_of_columns).each do |column_idx|
    new_row = (0...number_of_rows).map { |row_idx| matrix[row_idx][column_idx] }
    result << new_row
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

