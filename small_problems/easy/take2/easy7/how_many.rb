# How Many

def count_occurrences(list)
  occurrences = list.tally
  occurrences.each_pair do |element, count|
    puts "#{element} => #{count}"
  end
end

# LS solution
def count_occurrences(list)
  occurrences = {}

  list.uniq.each { |element| occurrences[element] = list.count(element) }

  occurrences.each { |element, count| puts "#{element} => #{count}" }
end

# Further exploration

def caseless_include?(list, element)
  caseless_list = list.map(&:downcase)
  caseless_list.include?(element.downcase)
end

def count_caseless_occurrences(list)
  caseless_list = list.map(&:downcase)

  names = list.each_with_object([]) do |element, names_arr|
    names_arr << element unless caseless_include?(names_arr, element)
  end

  occurrences = {}

  names.each do |element|
    occurrences[element] = caseless_list.count(element.downcase)
  end

  occurrences.each do |key, value|
    puts "#{key} => #{value}"
  end
end     

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


vehicles2 = [
  'car', 'Car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)
count_caseless_occurrences(vehicles2)