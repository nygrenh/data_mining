require_relative 'all'

students = Students.new('data-2016.csv')

puts students.support(['Ohjelmoinnin_perusteet'], ['Ohjelmoinnin_jatkokurssi'])
