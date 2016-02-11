require_relative 'all'

students = Students.new('data-2016.csv')

# This takes parallel courses into account
codes = students.map do |student|
  student.attempts.group_by(&:time).sort.map { |o| o[1].map{|c| c.code.to_i} }
end

a = students.courses.map { |e| [[e.code.to_i]] }

appriori = SequenceAppriori.new
appriori.appriori(codes, 0.01, a)
