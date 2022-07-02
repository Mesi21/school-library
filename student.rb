require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, permit, classroom)
    super(age, name, permit)
    @classroom = classroom
  end

  def classes(classroom)
    @classroom = classroom
    classroom.add_student.push(self) unless classroom.add_student.include?(self)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
