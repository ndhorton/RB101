# Rotating Matrices

# input: a matrix of arbitrary column size and row size
# output: the rotation of the given matrix by 90 degrees
# goal: transpose the matrix but with row elements in reverse order

# Given an array of arrays of integers, matrix
# Set row_size = number of rows in matrix
# Set column_size = number of columns in matrix

# Set rotated_matrix = empty array

# For column_index from 0 to column_size-1
#   Set new_row = empty array
#   For row_index from row_size-1 to 0
#     Append matrix[row][index] to new_row
#   Append new_row to rotated_matrix
# Return rotated_matrix

# def rotate90(matrix)
#   row_size = matrix.size
#   column_size = matrix.first.size

#   rotated_matrix = []

#   0.upto(column_size-1) do |column_idx|
#     new_row = []
#     (row_size-1).downto(0) do |row_idx|
#       new_row.push(matrix[row_idx][column_idx])
#     end
#     rotated_matrix.push(new_row)
#   end
#   rotated_matrix
# end

# LS solution / Further explorations
def rotate270(matrix) # mathematically we've been rotating -90 degrees
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

def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size

  (number_of_columns-1).downto(0).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row
  end
  result
end

def rotate180(matrix)
  result = matrix.reverse.map { |row| row.reverse }
end

def rotate360(matrix)
  matrix
end

def rotate_matrix(matrix, angle)
  case angle
  when 90  then rotate90(matrix)
  when 180 then rotate90(rotate90(matrix))
  when 270 then rotate90(rotate90(rotate90(matrix)))
  when 360 then matrix
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

new_matrix1 = rotate_matrix(matrix1, 270)
new_matrix2 = rotate_matrix(matrix2, 270)
# new_matrix3 = rotate270(rotate270(rotate270(rotate270(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2 
  

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate_matrix(matrix1, 90)
new_matrix2 = rotate_matrix(matrix2, 90)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
p new_matrix2 == [[2, 8], [4, 0], [7, 1], [3, 5]]
# p new_matrix3 == matrix2 

new_matrix1 = rotate_matrix(matrix1,180)
new_matrix2 = rotate_matrix(matrix2, 180)
# new_matrix3 = rotate90((rotate90(matrix2)))

p new_matrix1 == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p new_matrix2 == [[8, 0, 1, 5], [2, 4, 7, 3]]
# p new_matrix3 == new_matrix2
