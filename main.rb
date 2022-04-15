# !/usr/bin/env ruby

require_relative 'app'

class Main
  def display_choices
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books. 📖'
    puts '2 - List all people. 👤'
    puts '3 - Create a person.'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person ID.'
    puts '7 - Exit. ❌'
  end

  def main
    app = App.new
    selection = nil
    puts 'Welcome to the School Library App! 📖'
    while selection != 'Exit'
      display_choices
      selection = app.select_choice
    end
    puts 'Thank you for using the School Library App! ✨'
  end
end

Main.new.main
