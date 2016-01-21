require_relative 'all'

students = Students.new 'data-2016.csv'

puts students
  .with_passed('Ohjelmoinnin_jatkokurssi')
  .with_passed('Ohjelmoinnin_perusteet')
  .with_passed('Tietorakenteet_ja_algoritmit')
  .count
