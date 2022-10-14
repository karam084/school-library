require_relative '../student'

describe Student do
  context 'testing Student class' do
    student = Student.new('class 1', 30, 'Ask', parent_permission: true)

    it "Should return  'Teacher_name' as Teacher name" do
      expect(student.name).to eq 'Ask'
    end

    it "Should return  'Age' as Teacher age" do
      expect(student.age).to eq 30
    end

    it 'returns the correct spercialization' do
      expect(student.classroom).to eql 'class 1'
    end
  end
end
