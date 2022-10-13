# This is the Person class, parent of student and teacher classrequire_relative 'nameable'

require './nameable'
require './basedecorator'
require './capitalizedecorator'
require './trimmerdecorator'
require 'securerandom'

class Person < Nameable
  attr_accessor :age, :name, :rentals, :id
  def initialize(age, name, parent_permission)
    super()
    @id = nil || SecureRandom.random_number(1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end


  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
