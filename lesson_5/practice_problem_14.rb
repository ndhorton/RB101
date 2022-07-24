hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# arr = []
# hsh.each_value do |sub_hsh|
#   if sub_hsh[:type] == 'fruit'
#     arr << sub_hsh[:colors].map { |color| color.capitalize }
#   else
#     arr << sub_hsh[:size].upcase
#   end
# end
# p arr

# LS solution
arr = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map { |color| color.capitalize }
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
p arr