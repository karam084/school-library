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
