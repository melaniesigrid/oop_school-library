require_relative './person'

class Teacher < Person
  def initialize(id, specialization, parent_permission: true, name = 'Unknown', age: true)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
