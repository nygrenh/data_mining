require 'csv'
require_relative 'student'
require_relative 'students'
require_relative 'course_attempt.rb'

students = Students.new('data-2016.csv')

puts students
  .who_have('Ohjelmoinnin_jatkokurssi', 4)
  .who_have('Ohjelmoinnin_perusteet', 4)
  .who_have('Tietorakenteet_ja_algoritmit', 4)
  .count
