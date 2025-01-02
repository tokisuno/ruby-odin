class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    @grade > student.grade
  end

  protected

  attr_reader :grade
end

jim = Student.new('jim', 29)
james = Student.new('james', 50)

p james.better_grade_than?(jim)
