
require_relative 'person'

class Student < Person
  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include? self
  end
  
  def parent_permission
    @parent_permission
  end
end
