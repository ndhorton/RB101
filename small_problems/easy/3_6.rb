# Exclusive Or

def xor(p, q)
  !!(p && !q) || (!p && q)
end



p xor(true, true)
p xor(true, false)
p xor(false, true)
p xor(false, false)