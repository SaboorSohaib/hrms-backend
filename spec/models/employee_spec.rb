require 'rails_helper'

RSpec.describe Employee, type: :model do
  before(:each) do
    @employee = Employee.create(first_name: 'Abid', last_name: 'Rahman', email: 'abid@gmail.com',
                                phone: 786_189_455, gender: 'Male', photo: 'abid.jpg', hire_date: '2019-01-01', department_id: 1, user_id: 1)
  end

  it 'should belong to user' do
    employee = Employee.reflect_on_association(:user)
    expect(employee.macro).to eq(:belongs_to)
  end

  it 'should belong to department' do
    employee = Employee.reflect_on_association(:department)
    expect(employee.macro).to eq(:belongs_to)
  end

  it 'should have first_name' do
    @employee.first_name = 'Abid'
  end

  it 'should have last_name' do
    @employee.last_name = 'Rahman'
  end

  it 'should have email' do
    @employee.email = 'abid@gmail.com'
  end

  it 'should have phone number' do
    @employee.phone = 786_189_455
  end

  it 'should have gender' do
    @employee.gender = 'Male'
  end

  it 'should have hire date' do
    @employee.hire_date = '2019-01-01'
  end
end
