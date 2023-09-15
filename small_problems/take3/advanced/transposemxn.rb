# Transpose MxN

=begin

Notes:

(0...matrix.size).each do |row|
  (0...matrix.first.size).each do |column|

questions:
Do I have to check input matrix is not empty? No
Do I need to return a new array of arrays or should I mutate? No mutate
Do I need to check that each row has the same number of columns? No

Problem:
input:
output:

  Write a method that will transpose any matrix with at least 1 row
  and 1 column

rules:
  the matrix passed as argument will have at least 1 row, 1 column
  assuming the same number of columns in each row
  assuming I don't have to validate argument

Examples:

rows will be the size of the outer array
columns will be the size of any inner array

DS:

1 2 3 4
2 3 4 5

row size = 2
column size = 4

0...4 outer loop
0...2 inner loop

[0][0]
[1][0]

[0][1]
[1][1]

[0][2]
[1][2]

[0][3]
[1][3]
etc...

Algorithm:
Given an array of arrays, matrix
Set row_size := size of outer array
Set column_size := size of first inner array
Set new_matrix := an empty array
Iterate for 0 to column_size exclusive, column
  Set new_row := an empty array
  Iterate for 0 to row_size exclusive, row
    Push to new_row matrix[row][column]
  Push to new_matrix new_row
Return new_matrix

=end

def transpose(matrix)
  row_size = matrix.size
  column_size = matrix.first.size
  (0...column_size).each_with_object([]) do |column_index, new_matrix|
    new_row = (0...row_size).each_with_object([]) do |row_index, current_row|
      current_row << matrix[row_index][column_index]
    end
    new_matrix << new_row
  end
end

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

def transpose(matrix)
  row_size = matrix.size
  column_size = matrix.first.size

  (0...column_size).map do |column|
    (0...row_size).map { |row| matrix[row][column] }
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# 16:25
