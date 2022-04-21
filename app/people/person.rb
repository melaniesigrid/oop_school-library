require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id


  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    age >= 18
  end
  # rubocop:enable Naming/PredicateName

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

end
