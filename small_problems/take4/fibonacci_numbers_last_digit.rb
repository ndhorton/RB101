# Fibonacci Numbers (Last Digit)

=begin
Coderpad freaked out and I lost my work after finishing in 12:27
The reasoning was
F(n) (F(n-1)+F(n-2)) % 10 
1     1
1     1
2     2
3     3
5     5
8     8
13    (8 + 5) % 10 == 3
21    (3 + 8) % 10 == 1
34    (1 + 3) % 10 == 4
55    (4 + 1) % 10 == 5
89    (5 + 4) % 10 == 9
144   (9 + 5) % 10 == 4
...
Also, I remembered that the sequence of last digits repeats every 60 indexes
but this requires modification to allow F(0) to equal 0
You start with last = 1 and current = 0
The iteration will only run if nth if > 0
So if it is 0, you return current as-is -> 0
But if the iteration runs once for F(1)
last = 0
current = 0 + 1 = 1
Then iteration stops, so you return 1
But if the iteration runs twice
Then 
last = 0
current = 0 + 1 = 1
last = 1
current = 1 + 0 = 1
So we still return 1 for F(2)
Then if it ran again
last = 1
current = 1 + 1
So F(3) returns 2
and so on

This could also be achieved by having an early return after the modulo op 
`return 0 if nth == 0` *after* you do `nth %= 60`
=end

def fibonacci_last(nth)
  nth %= 60
  last = 1
  current = 0
  1.upto(nth) do |_index|
    temp = last
    last = current
    current = (current + temp) % 10
  end
  current
end

p fibonacci_last(60)

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
