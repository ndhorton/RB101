# Delete occurrences of an element if it occurs more than n times

=begin
Enough is enough!

Alice and Bob were on a holiday. Both of them took many pictures of the places they've been, and now they want to show Charlie their entire collection. However, Charlie doesn't like these sessions, since the motif usually repeats. He isn't fond of seeing the Eiffel tower 40 times.
He tells them that he will only sit for the session if they show the same motif at most N times. Luckily, Alice and Bob are able to encode the motif as a number. Can you help them to remove numbers such that their list contains each number only up to N times, without changing the order?
Task

Given a list and a number, create a new list that contains each number of list at most N times, without reordering.
For example if the input number is 2, and the input list is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].
With list [20,37,20,21] and number 1, the result would be [20,37,21].
=end

=begin

Notes:

Problem:
input: an array and an integer
output: a new array

Write a method that takes an array, list, and
an integer, n, and returns a new array with each
element from the input array occurring at most
n times. Ordering should remain the same except
for the removed excess numbers which should be
removed from the end of the array after
n of that element have been counted.

rules:
  assume return a new array? yes

Examples / test cases:

1 1 3 3 7 2 2 2 2  (3)
1 1 3 3 7 2 2 2

Data Structures:

a hash to record counts of unique elements

Algorithm:
Given an array, list, and an integer, n
Set counts := empty hash
Set result := empty array
Iterate through each number in list
  If number is a key in counts
    counts[number] = counts[number] + 1
  Else
    Set counts[number] := 1
  If counts[number] <= n
    Append number to result array
Return result
=end


def delete_nth(list, n)
  counts = Hash.new(0)
  list.each_with_object([]) do |number, result|
    result << number if (counts[number] += 1) <= n
  end
end

def delete_nth(list, n)
  counts = Hash.new(0)
  list.select do |number|
    (counts[number] += 1) <= n
  end
end

p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1, 1, 3, 3, 7, 2, 2, 2]

# 9:45
