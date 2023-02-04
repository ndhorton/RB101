
def buy_fruit(grocery_list)
  fruits = grocery_list.map do |(fruit, num)|
    str_arr = []
    num.times { str_arr << fruit }
    str_arr
  end

  fruits.flatten
end