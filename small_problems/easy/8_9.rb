# Reverse the digits in a number

# input: a positive integer
# output: that number with its order of digits reversed

# do not return leading zeros lest you end up with octal problems

# ds: very easy with string conversion, tricky with only numbers + array

# algo:
# -given a positive integer num
# -set digit_count = floor(log10(num)) + 1
# -set digits = empty array
# -set counter = 0
# -loop while counter < digit_count
# --prepend the remainder of num / (10 ** counter) to digits
# --increment counter
# -end loop
# -set reverse_counter = digit_count
# -set reverse_num = 0
# -loop while reverse_counter > 0
# --set reverse_num = reverse_num + digits[reverse_counter] * (10 ** reverse_counter)
# --decrement reverse_counter
# -end loop
# -return reverse_num

# def reversed_number(num)
#   num.to_s.reverse.to_i
# end

# -get number of digits, digit_count
# -set reverse_num = 0
# -loop while digit_count > 0
# --reverse_num += (num % 10) * (10 ** digit_count)
# --num /= 10
# --digit_count -= 1
# -end loop

def reversed_number(num)
  counter = (Math.log10(num)).floor
  reverse_num = 0
  loop do
    break if counter < 0
    reverse_num += (num % 10) * (10 ** (counter))
    num /= 10
    counter -= 1
  end
  reverse_num
end

# def reversed_number(num)
#   digit_count = (Math.log10(num)).floor + 1
#   digits = []
#   digit_count.times do |_|
#     digits.unshift(num % 10)
#     num /= 10
#   end
#   reverse_num = 0
#   digit_count.times do |i|
#     reverse_num += digits[i] * (10 ** i)
#   end
#   reverse_num
# end

# def reversed_number(num)
#   digits = num.digits
#   reverse_num = 0
#   digits.reverse_each.with_index do |digit, i|
#     reverse_num += digit * (10 ** i)
#   end
#   reverse_num
# end

# LS solution same as my first but with 3 lines clearly laid out instead of chained method calls
# def reversed_number(number)
#   string = number.to_s
#   reversed_string = string.reverse
#   reversed_string.to_i
# end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1