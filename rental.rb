class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
    @person = person
    @book = book
  end

  def book=(book)
    @book = book
    book.rentals.push(book) unless book.rentals.include(self)
  end

  def person=(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
end