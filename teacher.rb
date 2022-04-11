class Teacher < person
  def initialize(specialization, parent_permission, name = 'Unknown', age: "true")
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
