ages = { "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 5843,
         "Eddie" => 10,
         "Marilyn" => 22,
         "Spot" => 237
}

combined_age = 0
ages.each { |_, age| combined_age += age }
p combined_age

# LS solution
total_ages = ages.values.inject(:+)
p total_ages