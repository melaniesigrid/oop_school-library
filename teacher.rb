class Teacher < person
  def initialize (specialization, name = "Unknown", age = "true", parent_permission)
    super(age, paren_permission, name)
    @specialization = specialization
  end
  def can use services?
    true
  end
end