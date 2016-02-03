require_relative 'all'

# each list in the transactions list corresponds to the course codes
# that a single student has completed
transactions = [[53_001, 53_014], [53_001], [53_023, 53_025]]
# itemset contains the courses for which we wish to calculate the support for
itemset = [53_001, 53_014]
puts Magic.support(transactions, itemset) ## should output 0.33333...
