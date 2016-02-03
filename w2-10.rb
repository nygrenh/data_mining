require_relative 'all'

students = Students.new('data-2016.csv')
student_count = students.count

# codes = students.courses.map(&:code)
combinations = students.courses.combination(3)
sup = ThreadSafe::Array.new
Parallel.each(combinations, progress: 'Calculating...') do |combination|
  supportive = students.with_code(combination[0].code)
                       .with_code(combination[1].code)
                       .with_code(combination[2].code)
  support = supportive.count.to_f / student_count
  sup << combination if support >= 0.1
end

# 1131
puts sup.size
