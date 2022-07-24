ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?("Spot")
p ages.key?("Spot")
p ages.member?("Spot")
p ages.has_key?("Spot")

p ages.any?("Spot")

p ages.select {|k,v| k == "Spot"}
p ages.assoc("Spot")

p ages["Spot"] ? true : false
p ages.fetch("Spot", false )