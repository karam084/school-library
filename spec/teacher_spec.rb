require_relative '../teacher'

describe Teacher do
  context 'testing Teacher class' do
    teacher = Teacher.new('Math', 30, 'Ask', parent_permission: true)

    it "Should return  'Teacher_name' as Teacher name" do
      expect(teacher.name).to eq 'Ask'
    end

    it "Should return  'Age' as Teacher age" do
      expect(teacher.age).to eq 30
    end

    it 'returns the correct spercialization' do
      expect(teacher.specialization).to eql 'Math'
    end
  end
end
