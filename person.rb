require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    age >= 18
  end
  # rubocop:enable Naming/PredicateName

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private :is_of_age?
end


person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  puts capitalizedTrimmedPerson.correct_name