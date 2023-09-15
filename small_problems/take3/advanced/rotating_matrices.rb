# Rotating Matrices

=begin

notes:

Problem:

  Write a method that takes an arbitrary matrix and rotates it
  90 degrees clockwise.

rules:
  assuming matrix is regularly formed but not necessarily square
  assuming not to check argument for this
  assuming the matrix is not empty

Examples/test cases:

1  5  8
4  7  2
3  9  6

3  4  1
9  7  5
6  2  8

so based on previous exercise you would iterate backwards through
the first column to create the first row of the rotated matrix
BUT
We are iterating forwards through the columns

DS:

new array of arrays such that the row size becomes the column size
and vice versa

Algorithm:

Given an array of arrays, matrix
Set final_row := size of matrix - 1
Set final_column := size of the first array in matrix - 1

Set new_matrix := an empty array
Iterate for 0 up to final_column inclusive, column
  Set new_row := empty array
  Iterate for final_row down to 0 inclusive, row
    Push matrix[row][column] to new_row
  Push new_row to new_matrix
Return new_matrix
=end

def rotate90(matrix)
  final_row = matrix.size - 1
  final_column = matrix.first.size - 1

  new_matrix = []
  0.upto(final_column) do |column|
    new_row = []
    final_row.downto(0) { |row| new_row << matrix[row][column] }
    new_matrix << new_row
  end

  new_matrix
end

# LS solution
def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row.reverse
  end
  result
end

# Further exploration
def rotate(matrix, degree = 90)
  case degree
  when 90
    rotate90(matrix)
  when 180
    rotate90(rotate90(matrix))
  when 270
    rotate90(rotate90(rotate90(matrix)))
  when 360
    matrix
  else
    nil
  end
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

p rotate(matrix1, 270)

# 13:00

