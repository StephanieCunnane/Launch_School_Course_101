# first row => last column
# second row => second column
# third row => first column

# number of rows in the given matrix determines the number of columns in the returned matrix

# 3x3 solution
def rotate90(matrix)
  result = []
  (0..2).each do |column_idx|
    new_row = (0..2).map { |row_idx| matrix[row_idx][column_idx] }
    result << new_row.reverse
  end
  result
end

# Generalized solution
def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix[0].size
  (0...number_of_columns).each do |column_idx|
    new_row = (0...number_of_rows).map { |row_idx| matrix[row_idx][column_idx] }
    result << new_row.reverse
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

