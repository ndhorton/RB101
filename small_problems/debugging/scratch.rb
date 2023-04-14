methobj = [1, 4, 8, 3].method(:sort)

p methobj.call { |x, y| y <=> x }


