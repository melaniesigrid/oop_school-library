class Student < Person
  def initialize(classroom, parent_permission, name = 'Unknown', age = true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
