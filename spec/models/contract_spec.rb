require 'rails_helper'

RSpec.describe Contract, type: :model do
  before(:each) do
    @employee = Employee.create(first_name: 'Abid', last_name: 'Rahman', email: 'abid@gmail.com',
                                phone: 786_189_455, gender: 'Male', photo: 'abid.jpg', hire_date: '2019-01-01', department_id: 1, user_id: 1)
    @contract = Contract.create(starting_date: '2019-01-01', ending_date: '2019-01-01', contract_type: 'Full Time',
                                employee_id: @employee.id)
  end

  it 'shpuld have starting date' do
    @contract.starting_date = '2019-01-01'
  end

  it 'should have ending date' do
    @contract.ending_date = '2019-01-01'
  end

  it 'should have contract type' do
    @contract.contract_type = 'Full Time'
  end

  it 'should belong to employee' do
    contract = Contract.reflect_on_association(:employee)
    expect(contract.macro).to eq(:belongs_to)
  end
end
