class Student
  attr_accessor :attempts

  def initialize(data)
    @year = data[0]
    @data = data[1..-1].in_groups_of(5)
    @attempts = @data.map { |o| CourseAttempt.new o }
  end

  def passed?(course_name)
    has? course_name, 1..6
  end

  def has_code?(code)
    @attempts.any? { |a| a.code == code }
  end

  def has?(course_name, grade = 0..6)
    @attempts.any? do |a|
      if grade.is_a? Range
        (a.name == course_name || a.code == course_name) && grade.cover?(a.grade)
      else
        (a.name == course_name || a.code == course_name) && a.grade == grade
      end
    end
  end
end
