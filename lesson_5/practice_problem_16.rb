def mint_uuid
  hex_arr = [*'0'..'9', *'a'..'f']

  uuid = [8, 4, 4, 4, 12].map do |i| 
    part_string = ''
    i.times { part_string << hex_arr[rand(16)]}
    part_string
  end

  uuid.join('-')
end


p mint_uuid