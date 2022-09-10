# customer_orders = [ # customer orders must be an array of hashes, since each element passed in to the block is accessed with a key
#   { # Object customer_data must be hash 
#         orders: 
#           [ # Object :orders must be an array of hashes, since each element pased in is accessed with a key
#            {
#             order_value: 456
#            },
#           {
#             order_value: 544
#           }
#           ],
#         customer_id: 1111,
#         customer_name: 'Noem Chibbler'
#   },
#   { # Object customer_data must be hash 
#     orders: 
#       [ # Object :orders must be an array of hashes, since each element pased in is accessed with a key
#        {
#         order_value: 4
#        },
#       {
#         order_value: 1996
#       }
#       ],
#     customer_id: 1116,
#     customer_name: 'Brunt McFael'
# }  
# ]

# all_orders = customer_orders.map do |customer_data|
#   order_value = customer_data[:orders].inject(0) do |total, order_data|
#     total + order_data[:order_value]
#   end

#   {
#     customer_id: customer_data[:customer_id],
#     customer_name: customer_data[:customer_name],
#     total_order_value: order_value
#   }
# end
# p all_orders

# outer_hash = {
#   inner_array: [
#     {
#       secret: "vort",
#       time: "then"
#     }
#   ]
# }

# arr = outer_hash.map do |key, value|
#   value[0].each do |k, v|
#     p "The #{k} is #{v}"
#   end
# end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = munsters.reduce(0) do |sum, (name, data)|
  p name
  p data
  if data["gender"] == "male"
    sum + data["age"]
  else
    sum
  end
end

p total_age