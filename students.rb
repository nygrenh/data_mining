class Students
  include Enumerable

  def initialize(input)
    @students = input.is_a?(String) ? read_file(input) : input
    @with_code = Hash.new do |hash, key|
      hash[key] = Students.new(@students.select { |s| s.has_code? key })
    end
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

  def with(course_name, grade = 0..6)
    Students.new(@students.select { |s| s.has? course_name, grade })
  end

  def with_code(code)
    @with_code[code]
  end

  def with_all(*courses)
    all = self
    courses.each do |course|
      all = all.with(course)
    end
    all
  end

  def with_passed(course_name)
    with(course_name, 1..6)
  end

  def and(other)
    Students.new(students | other.students)
  end

  def support(from, to)
    with_all(*from, *to).count.to_f / @students.count
  end

  def confidence(from, to)
    with_all(*from, *to).count.to_f / with_all(*from).count
  end

  def courses
    used = Set.new
    courses = []
    @students.each do |student|
      student.attempts.each do |attempt|
        courses << attempt unless used.include? attempt.code
        used << attempt.code
      end
    end
    courses
  end

  protected

  attr_reader :students

  private

  def read_file(file)
    CSV.read(file, col_sep: ' ').each_with_object([]) do |line, array|
      array << Student.new(line)
    end
  end
end
