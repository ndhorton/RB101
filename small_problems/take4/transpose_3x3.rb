# Transpose 3x3

=begin

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

Notes:

Problem:
input: an array of arrays
output: a new array of new arrays

Write a method that takes a 3x3 arrays of arrays
and returns a new transposed array of arrays

rules:
  method must be non-destructive
  do I need to check matrix is 3x3? No
  do I need to check matrix is properly formed? No

Examples / test cases:

1 5 8
4 7 2
3 9 6

1 4 3
5 7 9
8 2 6

for i
  for j

matrix[j][i]

Data Structures:

Algorithm:
Given an array of arrays, matrix
Set new_matrix := an empty array
Iterate for column from 0 to matrix first element size exclusive
  Set new_row := empty array
  Iterate for row from 0 to matrix size exclusive
    Push matrix[row][column] to new_row
  Push new_row to new_matrix
Return new_matrix
=end

def transpose(matrix)
  new_matrix = []
  (0...matrix.first.size).each do |column|
    new_row = []
    (0...matrix.size).each do |row|
      new_row << matrix[row][column]
    end
    new_matrix << new_row
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# 9:52
