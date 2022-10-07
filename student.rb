require_relative 'Person'
# This is the Person class, parent of student and teacher class
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age: age, parent_permission: parent_permission, name: name)
    write_classroom(classroom)
  end

  def play_hooky
    '-\\("/)/-'
  end

  def write_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
