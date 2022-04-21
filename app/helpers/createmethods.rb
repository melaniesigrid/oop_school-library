require_relative 'validation'

module CreateMethods
  include Validation

  def create_person
    choice = validate_options('Do you want to create a student (1) or a teacher (2)? [Input the number]: ', [1, 2])
    age = validate_number('Age: ')

    print 'Name: '
    name = gets.chomp.strip

    case choice
    when 1
      create_student(age, name)
    when 2
      create_teacher(age, name)
    end
    puts 'Person created successfully'
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.strip.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    end
    @people << Student.new(age, name, parent_permission: parent_permission)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp.strip
    @people << Teacher.new(age, specialization, name: name)
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip

    print 'Author: '
    author = gets.chomp.strip
    @books << Book.new(title, author)

    puts 'Book created successfully'
  end

  def create_rental
    if @people.length > 0 && @books.length > 0
      puts 'Select a book from the following list by number:'
      list_books
      book_index = gets.chomp.strip.to_i
      puts 'Select a person from the following list by number (not id)'
      list_people
      person_index = gets.chomp.strip.to_i
      puts 'Date [YYYY/MM/DD]: '
      date = gets.chomp.strip
      rent = Rental.new(date, @books[book_index - 1], @people[person_index - 1])
      @rentals << rent unless @rentals.include?(rent)
      puts 'Rental created successfully.'
    else
      if @people.empty?
        puts "You must add people to create a rental."
      end
      if @books.empty?
        puts "You must add books to create a rental."
      end
    end
  end
end
