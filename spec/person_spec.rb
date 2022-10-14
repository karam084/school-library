require_relative '../person'

describe Person do
  it 'create a new person with a first and last name' do
    person = Person.new(20, 'Smith', parent_permission: true)
    expect(person.name).to eq('Smith')
    expect(person.age).to eq(20)
    expect(person.can_use_services?).to eql true
  end
end
