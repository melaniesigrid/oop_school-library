class Person
  def initialize(name = "Unknown", age = "true", parent_permission)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age
    age >=18 return true
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private :is_of_age?, :can_use_services?
end
