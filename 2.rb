require 'csv'
require_relative 'student'
require_relative 'course_attempt'

students = CSV.read('data-2016.csv', col_sep: ' ').each_with_object([]) do |line, array|
  array << Student.new(line)
end

puts students.count { |s| s.attempted? 'Ohjelmoinnin_perusteet' }
