require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'testing the Classroom class' do
    classroom = Classroom.new('Maths Class')

    it 'Should return "Math Class" as a label value' do
      expect(classroom.label).to eq 'Maths Class'
    end
  end
end

describe 'How to run specific Examples with Tags' do
  it 'is a slow test', book: true do
    sleep 5
    puts 'This test is slow!'
  end

  it 'is a fast test', fast: true do
    puts 'This test is fast!'
  end
end
