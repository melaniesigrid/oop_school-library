# frozen_string_literal: true

class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end
