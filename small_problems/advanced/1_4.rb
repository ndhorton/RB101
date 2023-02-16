# Transpose MxN

# Given an array of arrays, matrix
# Set row_size = number of rows (subarrays) in matrix
# Set column_size = number of columns (elements in first subarray)
# Set new_matrix = an array of (column_size) rows of (row_size) columns

# For each row from 0 up to not including row_size
#   For each column from 0 up to not including column_size
#     new_matrix[column][row] = matrix[row][column]

# return new_matrix

# def transpose(matrix)
#   row_size = matrix.size
#   column_size = matrix.first.size

#   new_matrix = Array.new(column_size) { Array.new(row_size) }

#   (0...row_size).each do |row|
#     (0...column_size).each do |column|
#       new_matrix[column][row] = matrix[row][column]
#     end
#   end

#   new_matrix
# end

# LS solution

def transpose(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size

  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end

  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


