class Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # rubocop:disable Naming/PredicateName
  def is_of_age?
  # rubocop:enable Naming/PredicateName
    age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private :is_of_age?
end
