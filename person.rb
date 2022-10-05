# This is the Person class, parent of student and teacher class
class Person
  def initialize(age, id = 0, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :age, :name

  def can_use_services?
    of_age? || @parent_permission
  end
  
  private

  def of_age?
    @age >= 18
  end
end
