require_relative '../book'

describe Book do
  context 'testing the Book class' do
    book = Book.new('Book_name', 'author')

    it "Should return  'Book_name' as Book name" do
      expect(book.title).to eq 'Book_name'
    end

    it "Should return  'author' as Book author" do
      expect(book.author).to eq 'author'
    end

    it 'returns the correct title' do
      expect(book.title).to eql 'Book_name'
    end
  end
end
