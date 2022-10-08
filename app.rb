require './basedecorator'
require './book'
require './capitalizedecorator'
require './classroom'
require './nameable'
require './person'
require './rental'
require './student'
require './teacher'
require './trimmerdecorator'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new(1)
  end

  def list_books
    @books.each_with_index { |book, index| puts "#{index}) #{book.title} by #{book.author}" }
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    type = gets.chomp.to_i
    while type != 1 && type != 2
      puts 'Please enter a valid option:'
      type = gets.chomp.to_i
    end
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if type == 1
      print 'Has parent permission? [Y/N] '
      letter = gets.chomp
      until %w[y Y n N].include?(letter)
        print 'Please enter a valid option:'
        letter = gets.chomp
      end
      permission = %w[y Y].include?(letter)
      new_person = Student.new(age: age, name: name, parent_permission: permission, classroom: @classroom)
    else
      print 'Specialization: '
      specialization = gets.chomp
      new_person = Teacher.new(age: age, name: name, specialization: specialization)
    end
    @people.push(new_person)
    @rentals.push([])
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    until @books[book_index]
      puts 'Please enter a valid option:'
      book_index = gets.chomp.to_i
    end
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    until @people[person_index]
      puts 'Please enter a valid option:'
      person_index = gets.chomp.to_i
    end
    puts 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals[person_index].push(new_rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    list_people
    print 'ID: '
    id = gets.chomp.downcase
    found = false
    person_index = -1
    @people.each_with_index do |person, index|
      if person.id == id
        person_index = index
        found = true
      end
    end
    until found
      print 'Please enter a valid option:'
      id = gets.chomp.downcase
      @people.each_with_index do |person, index|
        if person.id == id
          person_index = index
          found = true
        end
      end
    end
    @rentals[person_index].each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
