require_relative 'Person'
# This is the Person class, parent of student and teacher class
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age: age, parent_permission: parent_permission, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end