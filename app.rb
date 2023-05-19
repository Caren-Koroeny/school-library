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

      def create_student
        puts 'Name: '
        name = gets.chomp
    
        puts 'Age: '
        age = gets.chomp.to_i
    
        puts 'has parent permision (Y/N)'
        parent_permission = gets.chomp.downcase
    
        @person << Student.new(name, age, @classroom, parent_permission: parent_permission == 'y')
        puts 'Student created and added succesfully'
      end

      def create_teacher
        puts 'Name: '
        name = gets.chomp
    
        puts 'Age: '
        age = gets.chomp.to_i
    
        puts 'Specialization: '
        specialization = gets.chomp
    
        @person << Teacher.new(name, age, specialization)
        puts 'Teacher created and added successfully'
      end
      def create_book
        puts 'Title: '
        title = gets.chomp
    
        puts 'Author: '
        author = gets.chomp
    
        @book << Book.new(title, author)
        puts 'Book created and added successfully'
      end
      def create_rental
        puts 'Select a book from the following list by number'
        @book.each_with_index do |book, index|
          puts "#{index}) Title: #{book.title}, Author: #{book.author}"
        end
    
        book_id = gets.chomp.to_i
    
        puts 'Select a person from the following list by number (not ID)'
        @person.each_with_index do |person, index|
          puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
    
        person_id = gets.chomp.to_i
    
        print 'Date: yy/mm/dd '
        date = gets.chomp
    
        @rental << Rental.new(date, @person[person_id], @book[book_id])
        puts 'Rental created successfully'
      end