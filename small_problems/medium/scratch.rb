=begin
P:
input: a hash of family members as keys, each associated to another hash
ouptut: the same data structure with an `age_group` key in each family member's
hash associated with:
(0..17)  then 'kid'
(18..64) then 'adult'
(65..)   then 'senior'

A:
-given a hash
-get array of keys
-iterate over keys array
-set age = hash[key]["age"]
-set hash[key]["age_group"] = switch
--(0..17)  then 'kid'
  (18..64) then 'adult'
  (65..)   then 'senior'
end switch

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.keys.each do |key|
  age = munsters[key]["age"]
  munsters[key]["age_group"] =
    case age
    when (0..17)  then 'kid'
    when (18..64) then 'adult'
    when (65..)   then 'senior'
    end
end

p munsters