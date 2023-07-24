# Fix the Bug

=begin

(without running the code)

the elsif branch is missing a condition

the if branch seems to be fine

the else branch seems to correlate with the 1-element example (3 * 7 = 21)

the squared elements examples are arrays with 2 or more elements

so it seems necessary to add a conditional expression after elsif
that executes that branch if the size of the input array is greater than 1

I believe the original code will use the `map` invocation on `array` as
the condition for the `elsif` branch. `map` returns an array object,
so this will always evaluate as true in this boolean context (since an Array
is considered truthy, not being `nil` or `false`). Since the `if/elsif/else`
expression is the last evaluated expression in the method, and there is no code in
the `elsif` branch if the call to `map` is treated as the condition, this means the
empty `elsif` branch returns `nil` and the method returns `nil` for any non-empty
array. (The always-true condition of the `elsif` statement means that the `else` branch
cannot be reached).

(confirmed by running original code)

=end

# original code
def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# the fix
def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])