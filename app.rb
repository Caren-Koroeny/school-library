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
    def list_all_book
        if @book.empty?
          puts 'oops! the book list is emplty, kindly add a new book'
        else
          @book.each { |book| puts " Title: #{book.title}, Author: #{book.author}" }
        end
      end
      def list_all_people
        if @person.empty?
          puts 'oops! the people list is empty, kindly add a new people'
        else
          @person.each { |people| puts "#{people.class}, name: #{people.name}, ID: #{people.id}, Age: #{people.age}" }
        end
      end
      def create_person
        puts 'do you want to create a student (1) or a teacher (2)'
        option = gets.chomp
        case option
        when '1'
          create_student
        when '2'
          create_teacher
        else
          puts 'Invalid input, kindly try puting 1 or 2'
        end
      end