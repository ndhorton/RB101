munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |name, details|
#   if (0..17).include?(munsters[name]["age"])
#     age_group = 'kid'
#   elsif (18..64).include?(munsters[name]["age"])
#     age_group = 'adult'
#   else
#     age_group = 'senior'
#   end

#   munsters[name]["age_group"] = age_group
# end
# p munsters

# with case statement instead

munsters.each do |name, details|
  case munsters[name]["age"]
  when (0..17)
    age_group = 'kid'
  when (18..64)
    age_group = 'adult'
  when (65..)
    age_group = 'senior'
  end

  munsters[name]["age_group"] = age_group
end
p munsters

# LS solution
# munsters.each do |name, details|
#   case details["age"]
#   when 0...18
#     details["age_group"] = "kid"
#   when 18...65
#     details["age_group"] = "adult"
#   else
#     details["age_group"] = "senior"
#   end
# end