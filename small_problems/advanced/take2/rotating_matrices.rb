# Rotating Matrices

=begin

Notes:
questions:

Essentially, one could simply reverse the elements of the rows, while transposing via the
previous method

Problem:
input: an array of arrays
output: a new array of new arrays where the matrix has been rotated 90 degrees

  Write a method that rotates the numbers in a matrix of arbitrary dimensions
  composed by an array of arrays  

rules:
  a 90-degree rotation clockwise is congruent to a transposition followed by
    a reflection about the middle column (or between middle columns if even # of columns)
    of the transposed matrix
  do not mutate argument

Examples:

3  4  1
9  7  5

rotate minus90
9 3
7 4
5 1

rotate full180

5 7 9
1 4 3

rotate positive90
1 5
4 7
3 9


transpose
3 9
4 7
1 5

rotate
9 3
7 4
5 1

1 5 8
4 7 2
3 9 6

transpose
1 4 3
5 7 9
8 2 6

rotate
3 4 1
9 7 5
6 2 8

DS:

Algorithm:

Given an array of arrays, matrix
Set rows := matrix.size
Set columns := matrix.first.size
Set rotated_matrix := empty array
Iterate from 0 up to not incl columns, representing column_index
  Set new_row := empty array
  Iterate from 0 up to not incl rows, representing row_index
    Prepend matrix[row][column] to new_row
  Append new_row to rotated_matrix
Return rotatated_matrix

=end

def rotate90(matrix)
  rows = matrix.size
  columns = matrix.first.size
  rotated_matrix = []
  (0...columns).each do |column_index|
    new_row = []
    (0...rows).each do |row_index|
      new_row.unshift(matrix[row_index][column_index])
    end
    rotated_matrix.push(new_row)
  end
  rotated_matrix
end

def rotate90(matrix)
  (0...matrix.first.size).map do |column|
    (0...matrix.size).map { |row| matrix[row][column] }.reverse
  end
end

# Further exploration
def transpose(matrix, reverse_row, reverse_matrix)
  rotated_matrix = (0...matrix.first.size).map do |column|
    new_row = (0...matrix.size).map { |row| matrix[row][column] }
    reverse_row ? new_row.reverse : new_row
  end
  reverse_matrix ? rotated_matrix.reverse : rotated_matrix
end

def rotate(matrix, degree = :negative_90)
  case degree
  when :negative_90
    transpose(matrix, true, false)
  when :positive_90
    transpose(matrix, false, true)
  when :full_180
    matrix.map { |row| row.reverse }.reverse
  when :full_360
    matrix
  else
    nil
  end
end

# LS solution
def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
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

p matrix2
p rotate(matrix2)
p rotate(matrix2, :full_180)
p rotate(matrix2, :positive_90)
p rotate(matrix2, :full_360)


new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
