require './decorators/nameable'
require './associations/rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    age >= 18 || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(book, date)
    @rentals.push(Rental.new(date, book, self))
  end

  private

  def of_age?
    age >= 18
  end
end
