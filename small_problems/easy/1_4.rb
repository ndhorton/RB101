# How many?

def caseless_uniq(arr)
  copy = arr.map { |elem| elem.dup }
  unique = []
  while copy.length > 0
    current = copy.shift
    copy.delete_if { |elem| elem.downcase == current.downcase }
    unique << current
  end
  unique
end

def count_occurences(target)
  uniq_terms = caseless_uniq(target)
  term_count = {}
  uniq_terms.each do |uniq_term|
    counter = 0
    target.each do |elem|
      if elem.downcase == uniq_term.downcase
        counter += 1
      end
    end
  term_count[uniq_term] = counter
  end
  term_count.each { |term, count| puts "#{term} => #{count}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurences(vehicles)