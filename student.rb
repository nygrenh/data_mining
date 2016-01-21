require 'active_support'
require 'active_support/core_ext'

class Student
  def initialize(data)
    @year = data[0]
    @data = data[1..-1].in_groups_of(5)
    @attempts = @data.map { |o| CourseAttempt.new o }
  end

  def attempted?(course_name)
    @attempts.any? do |a|
      a.name == course_name
    end
  end

  def passed?(course_name)
    @attempts.any? do |a|
      a.name == course_name && a.grade > 0
    end
  end

  def gotten_grade?(course_name, grade)
    @attempts.any? do |a|
      if grade.is_a? Range
        a.name == course_name && grade.cover?(a.grade)
      else
        a.name == course_name && a.grade == grade
      end
    end
  end
end
