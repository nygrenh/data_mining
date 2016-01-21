require_relative 'all'

students = Students.new('data-2016.csv')

puts students
  .with('Ohjelmoinnin_jatkokurssi', 4)
  .with('Ohjelmoinnin_perusteet', 4)
  .with('Tietorakenteet_ja_algoritmit', 4)
  .count
