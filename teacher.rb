require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(_id, specialization, parent_permission: true, age: true, name = 'Unknown')
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
