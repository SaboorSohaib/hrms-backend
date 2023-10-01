require 'rails_helper'

RSpec.describe Department, type: :model do
  before(:each) do
    @department = Department.create(name: 'IT')
  end

  it 'should have name' do
    @department.name = 'IT'
  end

  it 'should have many employees' do
    department = Department.reflect_on_association(:employees)
    expect(department.macro).to eq(:has_many)
  end
end
