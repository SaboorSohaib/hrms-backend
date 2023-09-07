require 'rails_helper'

RSpec.describe Address, type: :model do
  before(:each) do
    @employee = Employee.create(first_name: 'Abid', last_name: 'Rahman', email: 'abid@gmail.com',
                                phone: 786_189_455, gender: 'Male', photo: 'abid.jpg', hire_date: '2019-01-01', department_id: 1, user_id: 1)
    @address = Address.create(province: 'kabul', distract: 'bagrami', employee_id: @employee.id)
  end

  it 'should have province' do
    @address.province = 'kabul'
  end

  it 'should have distract' do
    @address.distract = 'bagrami'
  end

  it 'should belong to employee' do
    address = Address.reflect_on_association(:employee)
    expect(address.macro).to eq(:belongs_to)
  end
end
