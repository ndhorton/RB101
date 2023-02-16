# Transpose 3x3

# input:3x3 matrix
# output: new matrix such that each column has become a row
# goal: iterate through first element of each subarray building first row
# of new matrix; repeat for second element of each subarray; third

# [0][0], [1][0], [2][0]
# [j][i]

# create new array of 3 empty arrays
# new_matrix = Array.new(3) { Array.new }

# for i from 0 to 2
#   for j from 0 to 2
#     push matrix[j][i] to new_matrix[i]

# def transpose(matrix)
#   new_matrix = Array.new(3) { Array.new }
#   3.times do |i|
#     3.times do |j|
#       new_matrix[i] << matrix[j][i]
#     end
#   end
#   new_matrix
# end

# LS solution

# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further explorations

# def transpose!(matrix)
#   [0, 1, 2].combination(2) do |a, b|
#     matrix[a][b], matrix[b][a] = matrix[b][a], matrix[a][b]
#   end
#   # matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
#   # matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
#   # matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# transpose!(matrix)

# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

def transpose!(matrix)
  (0...matrix.size).to_a.combination(2) do |a, b|
    matrix[a][b], matrix[b][a] = matrix[b][a], matrix[a][b]
  end
  # [0...matrix_size].combination(2) possibly generalizable to any size of square matrix
end

matrix_4x4 = [
  [1, 5, 8, 32],
  [4, 7, 2, 21],
  [3, 9, 6, 45],
  [48, 29, 91, 33]
]

transpose!(matrix_4x4)

p matrix_4x4 == [[1, 4, 3, 48], [5, 7, 9, 29], [8, 2, 6, 91], [32, 21, 45, 33]]

matrix_5x5 = [
  [1, 5, 8, 12, 13],
  [4, 7, 2, 14, 15],
  [3, 9, 6, 16, 17],
  [18, 19, 20, 21, 22],
  [23, 24, 25, 26, 27]
]

transpose!(matrix_5x5)

p matrix_5x5 == [
  [1, 4, 3, 18, 23],
  [5, 7, 9, 19, 24],
  [8, 2, 6, 20, 25],
  [12, 14, 16, 21, 26],
  [13, 15, 17, 22, 27]
]