require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(_id, age, classroom, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
