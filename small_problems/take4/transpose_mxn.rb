# Transpose MxN

=begin

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

Notes:

Problem:
input:
output:

Write a method that takes a matrix of unknown
width and height and returns a new transposed
matrix

rules:
  assume that it is a well-formed matrix (all rows same size)

Examples / test cases:

1 2 3 4 5
4 3 2 1 0
3 7 8 6 2

1 4 3
2 3 7
3 2 8
4 1 6
5 0 2

Data Structures:

Algorithm:
Given an array of arrays, matrix
Set new_matrix := an empty array
Iterate for column from 0 upto matrix first element size exclusive
  Set new_row := empty array
  Iterate for row from 0 upto matrix size exclusive
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

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# 7:00
