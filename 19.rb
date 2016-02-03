require_relative 'all'

students = Students.new('data-2016.csv')

puts students.confidence(%w(Ohjelmoinnin_perusteet Ohjelmoinnin_jatkokurssi), ['Tietorakenteet_ja_algoritmit'])
