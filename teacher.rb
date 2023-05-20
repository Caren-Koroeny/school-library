require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :age, :name, :id, :parent_permission

  # teacher = Teacher.new(specialization, age, name)
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end