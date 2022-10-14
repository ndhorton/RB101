orders = {
  lozenge_warehouse: [125.65, 392.34, 294.59],
  greeb_roofing: [282.91, 439.69, 1020.00],
  appleby_bakery: [20.34, 16.69]
}

new_accounts = {
  grigory_samovars: [390.33],
  egbill_books: [20.11]
}

potential_accounts = {
  locust_emporium: [],
  wallmart: []
}

projected_growth = new_accounts.merge(potential_accounts).keys.size

orders.merge!(new_accounts)

puts "New accounts projected for this quarter: #{projected_growth}"
p orders

# LS solution
cat = {name: "whiskers"}
weight = {weight: "10 lbs"}

puts cat.merge(weight)
puts cat
puts weight

puts cat.merge!(weight)
puts cat
puts weight
