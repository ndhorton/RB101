# Seeing Stars

=begin
P:

*  *  *
 * * * 
  ***  
*******
  ***  
 * * * 
*  *  *

*   *   *
 *  *  *
  * * *  
   ***   
*********
   ***   
  * * *  
 *  *  *
*   *   *

n = 7
mid = n / 2
i = 0
offset = 1
mid times: 
  output: (' ' * i) + '*' + (' ' * mid-offset) + '*' + (' ' * mid-offset) + '*'
  i++; offset++
output: '*' * n

offset = mid - 1
i = 0
mid times:
  output: (' ' * offset) + '*' + (' ' * i) + '*' + (' ' * i) + '*'
  i++
  offset--

=end

# def star(n)
#   mid = n / 2
  
#   offset = 1
#   mid.times do |i|
#     puts (' ' * i) + '*' + (' ' * (mid-offset)) + '*' + (' ' * (mid-offset)) + '*'
#     offset += 1
#   end

#   puts "*" * n

#   offset = mid - 1
#   mid.times do |i|
#     puts (' ' * offset) + '*' + (' ' * i) + '*' + (' ' * i) + '*'
#     offset -= 1
#   end
# end

# LS solution

def print_row(grid_size, distance_from_center)
  number_of_spaces  = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

system('clear')
star(9)

# Further explorations
=begin
12 chars across
6 chars down
        *  *              *  *
     *        *        *        *
    *          *      *          *
    *          *      *          *
     *        *        *        *
        *  *              *  *



=end
