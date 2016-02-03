require_relative 'all'

students = Students.new('data-2016.csv')

puts students.courses.count
