require_relative 'person'
# This is the Person class, parent of student and teacher class
class Student < Person
  attr_reader :classroom

  def initialize(classroom, *args)
    super(*args)
    # write_classroom(classroom)
    @classroom = classroom
  end

  def play_hooky
    '-\\("/)/-'
  end

  # def write_classroom(classroom)
  # @classroom = classroom
  # classroom.add_student(self)
  # end
end
