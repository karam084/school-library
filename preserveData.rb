require './book'
require './person'
require './student'
require './teacher'
require './rental'
require 'json'



class PreserveData
    # write book

    def self.write_books(books)
        book_array = []
        books.each do |book|
            book_array << {
                title: book.title,
                author: book.author
            }
        end
        File.write('./data/books.json', JSON.pretty_generate(book_array))
    end

    #read book
    def self.read_books(book)
        book_array = []
        return book_array unless File.exist?('data/books.json')

        book_file = File.open('./data/books.json')
        data = JSON.parse(book_file.read)
        data.each do |book|
            book_array << Book.new(book['title'], book['author'])
        end
        book_file.close
        book_array
    end

    #write people
    def self.write_people(people)
        people_array = []
        people.each do |person|
            if person.instance_of?(Student)
                people_array << {
                    id: person.id,
                    age: person.age,
                    name: person.name,
                    # parent_permission: person.parent_permission
                }
            else
                people_array << {
                    id: person.id,
                    age: person.age,
                    specialization: person.specialization,
                    name: person.name,
                }
            end
        end
        File.write('./data/people.json', JSON.pretty_generate(people_array))
    end

    #read from people
    def self.read_people(people)
        people_array = []
        return people_array unless File.exist?('./data/people.json')

        people_files = File.open('./data/people.json')
        data = JSON.parse(people_files.read)
        data.each do |person|
            if person['class'] == 'Student'
                student = Student.new(person['age'], person['name'], person['classroom'], person['parent_permission'])
                student.id = person['id']
                people_array << student
            else
                teacher = Teacher.new(person['age'], person['name'], person['specialization'])
                teacher.id = person['id']
                people_array << teacher
            end
        end
        people_files.close
        people_array
    end


    # write rentals

    def self.write_rentals(rentals)
        rental_array = []
        rentals.each do |rental|
            rental_array << {
                date: rental.date,
                title: rental.book.title,
                author: rental.book.author,
                name: rental.person.name,
                age: rental.person.age,
                parent_permission: rental.person.parent_permission
            }
        end
        File.write('data/rentals.json', JSON.pretty_generate(rental_array))
    end

    # read rentals

    def self.read_rentals(rentals)
        rental_array = []
        return rental_array unless File.exist?('./data/rentals.json')

        rental_file = File.open('data/rentals.json')
        data = JSON.parse(rental_file.read)
        data.each do |rental|
            individual = Person.new(rental['age'], rental['name'], rental['parent_permission'])
            individual.id = rental['id']
            available_book = Book.new(rental['title'], rental['author'])
            available_rentals = Rental.new(rental['date'], available_book, individual)
            rental_array << available_rentals
        end
        rental_file.close
        rental_array
    end

end