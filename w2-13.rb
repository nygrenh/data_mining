require_relative 'all'

list1 = [1, 2, 3]
list2 = [1, 2, 4]

combined = Magic.union(list1, list2) # should return a list [1, 2, 3, 4]
puts combined.inspect # should output [1, 2, 3, 4]
