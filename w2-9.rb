require_relative 'all'

students = Students.new('data-2016.csv')

combinations = ThreadSafe::Array.new(students.courses.combination(2).to_a)
sup = ThreadSafe::Array.new
Parallel.each(combinations) do |combination|
  s = students.support([combination[0].code], [combination[1].code])
  sup << combination if s >= 0.1
end

# 375
puts sup.size
