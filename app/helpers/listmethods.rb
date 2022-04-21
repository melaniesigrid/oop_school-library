module ListMethods

  def list_people
    if @people.empty?
      puts "No people added yet."
    end
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_books
    if @books.empty?
      puts "No books added yet."
    end
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
      end
  end

  def list_rentals
    if @rentals.empty?
      puts "No rentals recorded yet."
      else
        list_people
        print 'ID of person: '
        requested_id = gets.chomp.strip.to_i
        puts 'Rentals: '
        @rentals.each do |rental|
          puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}" if requested_id == rental.person.id
        end
      end
  end
end