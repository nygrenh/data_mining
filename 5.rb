require_relative 'all'

students = CSV.read('data-2016.csv', col_sep: ' ').each_with_object([]) do |line, array|
  array << Student.new(line)
end

puts students.count { |s| s.has? 'Tietorakenteet_ja_algoritmit', 4 }
