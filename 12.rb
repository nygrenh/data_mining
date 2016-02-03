require_relative 'all'

students = Students.new('data-2016.csv')

support = students
          .with('Ohjelmoinnin_jatkokurssi')
          .with('Ohjelmoinnin_perusteet')
          .count

# Support
puts support.to_f / students.count
