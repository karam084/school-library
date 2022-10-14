require_relative '../rental'

describe Rental do
  context 'testing Rental class' do
    rentals = Rental.new('10-10-2022', 'book1', 'Aly')

    it "Should return  'Rental_date' as Rental date" do
      expect(rentals.date).to eq '10-10-2022'
    end

    it "Should return  'Book' as Rental book" do
      expect(rentals.book).to eq 'book1'
    end

    it 'returns the correct person' do
      expect(rentals.person).to eql 'Aly'
    end
  end
end
