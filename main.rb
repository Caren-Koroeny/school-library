require_relative './app'

class Options
    def initialize
        @app = App.new
        puts "\nWELCOME TO THE SCHOOL LIBRARY APP!\n"
        show_menu
    end
    def select_option(user_choice)
        case user_choice
        when '1'
          @app.list_all_book
        when '2'
          @app.list_all_people
        when '3'
          @app.create_person
        when '4'
          @app.create_book
        when '5'
          @app.create_rental
        when '6'
          @app.list_all_rentals
        else
          puts 'Invalid option, please try again!'
        end
        show_menu
      end
      
      def show_menu
        puts "\nPlease choose an option by entering a number:"
        puts '1 -  List all books'
        puts '2 -  List all people'
        puts '3 -  Create a person'
        puts '4 -  Create a book'
        puts '5 -  Create a rental'
        puts '6 -  List all rentals for a given person id'
        puts '7 -  Exit'
        user_choice = gets.chomp
        return exit if user_choice == '7'
    
        select_option(user_choice)
      end

      def exit
        puts 'Thank you for using the app, see you later!'
      end
    end
    
    