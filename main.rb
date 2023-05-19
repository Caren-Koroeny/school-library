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
    