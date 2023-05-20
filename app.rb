require 'date'

require './associations/book'
require './student'
require './associations/rental'
require './teacher'
require './user_input'

class App
  def initialize(main_choices, books = [], people = [])
    @books = books
    @people = people
    @main_choices = main_choices
  end

  def run
    loop do
      puts @main_choices
      choice = UserInput.get_number('', 'Please enter a valid number!')
      return if choice == 7

      run_available_options(choice)
    end
  end

  private

  def run_available_options(choice)
    case choice
    when 1
      list_books(@books)
    when 2
      list_people(@people)
    when 3
      add_person
    when 4
      @books << add_book
    when 5
      add_rental(@books, @people)
    when 6
      list_rentals(@people)
    else
      puts ''
    end
  end

  def add_person
    person_type = UserInput.get_number(
      'Do you want to create a Student (1) or a teacher (2)?. Back to main (any number): ',
      'Please enter a valid number!'
    )

    case person_type
    when 1
      @people << add_student
    when 2
      @people << add_teacher
    else
      puts ''
    end
  end

  def add_student
    age = UserInput.get_number('Age: ', 'Please enter a valid number!')
    name = UserInput.get_str('Name: ', 'Please enter a proper name!')
    permission = UserInput.get_bool('Parent permission (y/n): ', 'Please enter either (y/n)!')
    student = Student.new(age, name, parent_permission: permission)
    return unless student

    puts "Student #{name} is added!\n\n"
    student
  end

  def add_teacher
    age = UserInput.get_number('Age: ', 'Please enter a valid number!')
    name = UserInput.get_str('Name: ', 'Please enter a proper name!')
    specialization = UserInput.get_str('Specialization: ', 'Please enter a proper specialization!')
    teacher = Teacher.new(specialization, age, name)
    return unless teacher

    puts "Teacher #{name} is added!\n\n"
    teacher
  end

  def add_book
    title = UserInput.get_str('Title: ', 'Please enter a valid title!')
    author = UserInput.get_str('Author: ', 'Please enter a valid author!')
    book = Book.new(title, author)
    return unless book

    puts "Book #{title} is created successfully!\n\n"
    book
  end

  def list_books(books, with_id: false)
    if with_id
      books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
    else
      if books.empty?
        puts "No books added yet\n\n"
        return
      end
      books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
  end

  def list_people(people, with_id: false)
    if with_id
      people.each_with_index do |person, idx|
        puts "#{idx}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    else
      if people.empty?
        puts "No person created yet\n\n"
        return
      end
      people.each { |person| puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    end
    puts ''
  end

  def add_rental(books, people)
    if people.empty? || books.empty?
      puts "Either People or book List is empty. Please populate these lists in order to check rentals\n\n"
      return
    end

    puts 'Select a book from the following list:'
    list_books(books, with_id: true)
    book_idx = UserInput.get_number('Book: ', 'Please enter a valid number!')

    puts 'Select a person from the following list:'
    list_people(people, with_id: true)
    person_idx = UserInput.get_number('Borrower: ', 'Please enter a valid number!')
    date = UserInput.get_date('Date: ', 'Please enter a valid date!')

    begin
      person = people.at(person_idx)
      book = books.at(book_idx)
      rental = Rental.new(date, book, person)
      person.rentals << rental
    rescue NoMethodError
      puts "Book or person not found. Please try again!\n\n"
      return add_rental(books, people)
    end

    puts "Rental Added!\n\n"
  end

  def list_rentals(people)
    if people.empty?
      puts "People List is empty. Please add people in order to check their rentals\n\n"
      return
    end
    puts 'Select a person ID from the following list:'
    list_people(people)

    person_id = UserInput.get_number('Person ID: ', 'Please enter a valid number!')
    person = people.find { |current_person| current_person.id == person_id }
    if person.nil?
      puts "Person with ID: #{person_id} not found!\n\n"
      return list_rentals(people)
    end

    if person.rentals.empty?
      puts "#{person.name} didn't rent any book yet\n\n"
    else
      puts "Rentals for #{person.name}:"
      person.rentals.each { |rental| display_rental(rental) }
      puts "\n"
    end
  end

  def display_rental(rental)
    case rental.book
    when Book
      puts "Date: #{rental.date}, Book: #{rental.book.title} By #{rental.book.author}"
    when Teacher
      puts "Date: #{rental.date}, Teacher: #{rental.book.name}, Specialization: #{rental.book.specialization}"
    when Student
      puts "Date: #{rental.date}, Student: #{rental.book.name}, Parent Permission: #{rental.book.parent_permission}"
    end
  end
end
