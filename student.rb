require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students_list.push(self) unless classroom.students_list.include?(self)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
