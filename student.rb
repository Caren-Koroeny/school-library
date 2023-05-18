require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(_age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)

  def play_hooky
    '¯(ツ)/¯'
  end
end
