# Name Swapping

# input: a string in the format "firstname lastname"
# output: a new string in the format "lastname, firstname"

# Given a string, full_name
# Set names := split(full_name, ' ') -> array
# names = reverse(names)
# Return join(names, ', ') -> string

def swap_name(full_name)
  full_name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

