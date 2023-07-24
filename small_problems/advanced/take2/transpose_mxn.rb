# Transpose MxN

=begin

Notes:
questions:
  does (m >= 1 and n >= 1) need to be checked and handled?

just remembering and editing last exercise method

def transpose(matrix)
  rows = matrix.size
  columns = matrix.first.size

  transposed_matrix = []
  (0...columns).each do |columns|
    new_row = (0...rows).map { |rows| matrix[row][column]] }
    transposed_matrix << new_row
  end
  transposed_matrix
end

The range needs to be half-closed (#size off by 1)

Problem:
input: an array of arrays
output: a new array of new arrays representing the transposition of the input arr of arrs

  Write a method that transposes any sized matrix where M is the number of rows
  and N is the number of columns and both M and N are >= 1

rules:
  matrix will always have at least 1 row and 1 column
  do not mutate caller
  the rows/nested arrays must be of uniform size
  the number of columns does not need to be equal to number of rows

Examples:

1 2 3 4

1
2
3
4

DS:

Algorithm:

Given an array of arrays, matrix
Set rows := number of arrays in outer array
Set columns := number of elements in each/any subarray
Set transposed_matrix := empty array
Iterate from 0 up to not including columns, representing column
  Set new_row := empty array
  Iterate from 0 up to not including rows, representing row  
    Append matrix[row][column] to new_row
  Append new_row to transposed_matrix
Return transposed_matrix

=end

def transpose(matrix)
  rows = matrix.size
  columns = matrix.first.size
  (0...columns).map do |column|
    (0...rows).map { |row| matrix[row][column] }
  end
end

# LS solution
def transpose(matrix)
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  result = []
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# Difficult to think of a way of mutating the argument array
# that is simpler than this because you need a different
# number of inner arrays unless the matrix is square
# so you can't really do it completely in-place anyway
def transpose!(matrix)
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  result = []
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  matrix.replace(result)
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

matrix = [
  [1, 2, 3, 4, 5],
  [4, 3, 2, 1, 0],
  [3, 7, 8, 6, 2]
]

transpose!(matrix)
p matrix