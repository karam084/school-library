# This is the Person class, parent of student and teacher classrequire_relative 'nameable'

require './nameable'
require './basedecorator'
require './capitalizedecorator'
require './trimmerdecorator'

class Person < Nameable
  def initialize(age:, id: 0, name: 'Unknown', parent_permission: true)
    super
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :age, :name

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
