# Palindromic strings 1

# my solution to further exploration
# def palindrome?(obj)
#   reverse_str = ''
#   reverse_arr = []
#   i = 0
#   while i < obj.length
#     reverse_str << obj[-(i + 1)]
#     i += 1
#   end
#   i = 0
#   while i < obj.length
#     reverse_arr << obj[-(i + 1)]
#     i += 1
#   end
#   obj == reverse_str || obj == reverse_arr
# end

# simplified using idea from user submitted solutions
def palindrome?(obj)
  reverse_obj = obj.class.new
  idx = 0
  while idx < obj.length
    reverse_obj << obj[-(idx + 1)]
    idx += 1
  end
  obj == reverse_obj
end

# of course this works too
# def palindrome?(obj)
#   obj == obj.reverse
# end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

p palindrome?(['a','b','a']) == true
p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?([1, 3, 2, 2, 1]) == false
p palindrome?(['a', 'bee', 'be', 'eh']) == false
p palindrome?(['A', 'b', 'a']) == false