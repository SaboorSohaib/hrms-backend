require 'rails_helper'

RSpec.describe Salary, type: :model do
  before(:each) do
    @employee = Employee.create(first_name: 'Abid', last_name: 'Rahman', email: 'abid@gmail.com',
                                phone: 786_189_455, gender: 'Male', photo: 'abid.jpg', hire_date: '2019-01-01', department_id: 1, user_id: 1)
    @salary = Salary.create(salary_amount: 10_000, month: 'April', employee_id: @employee.id)
  end

  it 'should have salary amount' do
    @salary.salary_amount = 10_000
  end

  it 'should have month' do
    @salary.month = 'April'
  end

  it 'should belong to employee' do
    salary = Salary.reflect_on_association(:employee)
    expect(salary.macro).to eq(:belongs_to)
  end
end
