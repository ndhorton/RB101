def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  selected_produce = {}

  counter = 0
  loop do
    break if counter >= produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Vegetable')
p general_select(produce, 'Fruit')
p general_select(produce, 'Meat')