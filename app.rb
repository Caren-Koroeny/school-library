require_relative './associations/book'
require_relative './associations/classroom'
require_relative './associations/rental'
require_relative './person'
require_relative './student'
require_relative './teacher'

class App
    def initialize
      @book = []
      @person = []
      @rental = []
      @classroom = Classroom.new('grade 12')
    end
  