require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'validation'

class App
include Validation

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def select_choice
    choice = validate_options('', (1...9))
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      'Exit'
    else
      puts 'Unknown option, try again'
    end
  end

  def create_person
    choice = validate_options('Do you want to create a student (1) or a teacher (2)? [Input the number]: ', [1, 2])
    age = validate_number('Age: ')

    print 'Name: '
    name = gets.chomp.strip

    case choice
      when 1
        create_student(name, age)
      when 2
        create_teacher(name, age)
    end
    puts 'Person created successfully'
  end

  def create_student(name, age)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.strip
    if parent_permission.upcase == 'Y'
      parent_permission = true
    elsif parent_permission.upcase == 'N'
      parent_permission = false
    end
    @people << Student.new(age, name: name, parent_permission: parent_permission)
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp.strip
    @people << Teacher.new(specialization, age, name: name)
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip

    print 'Author: '
    author = gets.chomp.strip
    @books << Book.new(title, author)

    puts 'Book created successfully'
  end

  def list_people
    if @people == []
      puts 'No people added yet.'
    end
    @people.each_with_index {|person, index| puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
  end

  def list_books
    if @books == []
      puts 'No books added yet.'
    end
    @books.each_with_index {|book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"}
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_books
    book_index = gets.chomp.strip.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.strip.to_i
    puts 'Date [YYYY/MM/DD]: '
    date = gets.chomp.strip
    @rentals << Rental.new(@books[book_index -1], @people[person_index -1], date)
    puts 'Rental created successfully.'
  end

  def list_rentals
    list_people
    print 'ID of person: '
    id = gets.chomp.strip.to_i
    person_selected = @people.select{|person| person.id == id}[0]
    person_selected.rentals.each {|rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\", by #{rental.book.author}"}
  end
end