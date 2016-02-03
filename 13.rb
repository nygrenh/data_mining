require_relative 'all'

students = Students.new('data-2016.csv')

puts students
  .with('Ohjelmoinnin_jatkokurssi')
  .with('Ohjelmoinnin_perusteet')
  .count
