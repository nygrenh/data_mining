require_relative 'all'

students = Students.new('data-2016.csv')

puts students.courses.combination(2).to_a.size
