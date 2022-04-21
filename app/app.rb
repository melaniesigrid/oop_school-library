require_relative './people/student.rb'
require_relative './people/teacher'
require_relative './lib/book'
require_relative './lib/rental'
require_relative './helpers/validation'
require_relative './helpers/listmethods'
require_relative './helpers/createmethods'

class App
  include Validation
  include ListMethods
  include CreateMethods
  attr_accessor :books, :people

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def select_choice
    choice = validate_options('', (1...9))
    case choice
    when 1, 2, 6
      list_tasks(choice)
    when 3, 4, 5
      create_tasks(choice)
    when 7
      'Exit'
    else
      puts 'Unknown option, please select from the options menu.'
    end
  end

  def list_tasks(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 6
      list_rentals
    end
  end

  def create_tasks(choice)
    case choice
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    end
  end
end
