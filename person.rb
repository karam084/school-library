# This is the Person class, parent of student and teacher classrequire_relative 'nameable'

require './nameable'
require './basedecorator'
require './capitalizedecorator'
require './trimmerdecorator'
require 'securerandom'

class Person < Nameable
  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.hex(3)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :age, :name, :rentals

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
