# Transpose 3x3

=begin

Notes:

arr2[0][0] = arr1[0][0]
arr2[0][1] = arr1[1][0]
arr2[0][2] = arr1[2][0]

arr2[1][0] = arr1[0][1]
arr2[1][1] = arr1[1][1]
arr2[1][2] = arr1[2][1]

arr2[2][0] = arr1[0][2]
arr2[2][1] = arr1[1][2]
arr2[2][2] = arr1[2][2]

Problem:
input: an array of arrays
output: a new array of new arrays that represents the transpose of the input

  Write a method that transposes a 3x3 array of arrays without
  mutating the input array

rules:
  1) return a new array; do not mutate argument
  2) row_index for input becomes column_index for output
  3) column_index for input becomes row_index for output

Examples:

(1) 5 8
4 (7) 2
3 9 (6)

(1) 4 3
5 (7) 9
8 2 (6)

Further exp:

matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]

DS:

Algorithm:

Given an 3-element array of 3-element arrays, input_arr
Instantiate an array of 3 empty arrays, output_arr
Iterate for 0 through 2 representing |input_column|
  Iterate for 0 through 2 representing |input_row|
    Set output_arr[input_column][input_row] = input_arr[input_row][input_column]
Return output_arr

=end

def transpose(input_arr)
  output_arr = [[], [], []]
  3.times do |input_column|
    3.times do |input_row|
      output_arr[input_column][input_row] = input_arr[input_row][input_column]
    end
  end
  output_arr
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
  [*(0...matrix.first.size)].combination(2) do |row, column|
    matrix[row][column], matrix[column][row] = 
      matrix[column][row], matrix[row][column]
  end
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
transpose!(matrix)
p matrix
