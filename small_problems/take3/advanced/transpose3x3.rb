# Transpose 3x3

=begin

Notes:

questions:

Problem:
input:
output:

  Write a method that accepts a matrix and returns the transpose
  of the original.

rules:
  must return a new matrix, rather than mutating input
  matrix will be 3x3
  do not use Array#transpose method

Examples:

1  5  8
4  7  2
3  9  6

swap [1][0], [0][1]
swap [2][0], [0][2]
swap [2][1], [1][2]

This would mean creating a deep copy

=>
1  4  3
5  7  9
8  2  6




DS:

Algorithm:
Given a 3x3 array of arrays, matrix
Create a new empty array, new_matrix
Iterate 3 times for 0 to 2 inclusive, row
  Set new_row := empty array
  Iterate 3 times for 0 to 2 inclusive, column
    Push matrix[column][row] to new_row (i.e. putting column for row, row for column)
  Push new_row to new_matrix
Return new matrix

=end

def transpose(matrix)
  new_matrix = []
  (0..2).each do |row|
    new_row = []
    (0..2).each { |column| new_row << matrix[column][row] }
    new_matrix << new_row
  end
  new_matrix
end

# LS solution
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# Further exploration
def transpose!(matrix)
  matrix[1][0], matrix[0][1] = matrix[0][1], matrix[1][0]
  matrix[2][0], matrix[0][2] = matrix[0][2], matrix[2][0]
  matrix[2][1], matrix[1][2] = matrix[1][2], matrix[2][1]
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
matrix_object_id = matrix.object_id
transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix.object_id == matrix_object_id

# 15:27
