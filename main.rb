require_relative './app'

class Options
    def initialize
        @app = App.new
        puts "\nWELCOME TO THE SCHOOL LIBRARY APP!\n"
        show_menu
    end
    