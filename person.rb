require_relative './nameable'
class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    @name = name
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end
