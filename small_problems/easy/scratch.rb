# input: an array of consecutive, increasing letters with one gap
# output: the missing letter in the gap

# algo:
# -Given an array of letters
# -Iterate through the array
# --compare each letter (first letter) with the next letter (second letter)
# --if second letter is more than 1 higher than first letter
# ---return the letter 1 higher than the first letter  

def find_missing_letter(arr)
  i = 0
  while i < (arr.length - 1)
    if (arr[i + 1].ord - arr[i].ord) != 1
      return (arr[i].ord + 1).chr
    end
    i += 1
  end
end

p find_missing_letter(["a", "b", "c", "d", "f"])