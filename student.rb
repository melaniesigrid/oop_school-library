class Student < Person
  def initialize (classroom, name = "Unknown", age = "true", parent_permission)
    super(age, paren_permission, name)
    @classroom = classroom
  end
  def play_hooky
    "¯\(ツ)/¯"
  end
end
