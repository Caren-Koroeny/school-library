class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(_label)
    @label = label
    @students = []
  end

  def add_students(student)
    @students.push(student)
    student.classroom = self
  end
end
