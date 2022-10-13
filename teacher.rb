require './person'
# This is the Person class, parent of student and teacher class
class Teacher < Person
  attr_reader :parent_permission
  attr_accessor :specialization, :id

  def initialize(specialization, *args)
    super(*args)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
