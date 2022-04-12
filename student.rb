require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(_id, classroom, parent_permission, name='Unknown', age: true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
