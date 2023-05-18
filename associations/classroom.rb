class Classroom
    attr_accessor :label
    attr_reader :students

    def initialize(label)
        @lable = lable
        @students = []
  end

  def add_students(student)
    @students.push(student)
    student.classroom = self
  end
end