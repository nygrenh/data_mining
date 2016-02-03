require_relative 'all'

# example 1:

lists = [[1, 2, 3], [1, 2, 4]]
p Magic.generate(lists) # should output [[1, 2, 3, 4]]

# example 2:

lists = [[1, 2, 3, 4], [1, 2, 3, 5], [1, 3, 6, 8], [1, 3, 6, 10]]
p Magic.generate(lists) # should output [[1, 2, 3, 4, 5], [1, 3, 6, 8, 10]]
