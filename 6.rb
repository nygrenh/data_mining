require 'csv'
require_relative 'student'
require_relative 'course_attempt.rb'

students = CSV.read('data-2016.csv', col_sep: ' ').each_with_object([]) do |line, array|
  array << Student.new(line)
end

puts students.count { |s| s.gotten_grade? 'Ohjelmoinnin_perusteet', 2..3 }
