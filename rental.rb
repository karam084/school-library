class Rental
  attr_accessor :date, :id
  attr_reader :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    # book.rentals.push(self)
    # person.rentals.push(self)
  end
end
