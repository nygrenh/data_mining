class CourseAttempt
  attr_accessor :time, :code, :name, :credits, :grade

  def initialize(data)
    @time, @code, @name, @credits, @grade = data
    @grade = @grade.to_i
  end
end
