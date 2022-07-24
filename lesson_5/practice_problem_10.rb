arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

test = arr.map do |hsh|
  new_hsh = {}
  hsh.keys.each do |key|
    new_hsh[key] = hsh[key] + 1
  end
  new_hsh
end

p test
p arr