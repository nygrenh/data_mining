class Students
  include Enumerable

  def initialize(input)
    @students = input.is_a?(String) ? read_file(input) : input
  end

  def to_a
    @students
  end

  def [](i)
    @students[i]
  end

  def each(&block)
    @students.each(&block)
  end

  def who_have(course_name, grade = 0..6)
    Students.new(@students.select { |s| s.gotten_grade? course_name, grade })
  end

  private

  def read_file(file)
    CSV.read(file, col_sep: ' ').each_with_object([]) do |line, array|
      array << Student.new(line)
    end
  end
end
