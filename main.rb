require './app'

def main_choices
  "Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person
  7 - Exit"
end

def main
  puts "Welcome to School Library App!\n\n"
  app = App.new(main_choices)
  app.run
end

main