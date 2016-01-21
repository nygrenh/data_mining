require 'csv'
require 'set'

data = CSV.read('data-2016.csv', col_sep: ' ')

ids = Set.new

data.each do |line|
  start = 2
  while start < line.length
    ids << line[start] if line[start]
    start += 5
  end
end

puts ids.size
