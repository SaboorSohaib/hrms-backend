require 'rails_helper'

RSpec.describe Attendance, type: :model do
  before(:each) do
    @employee = Employee.create(first_name: 'Abid', last_name: 'Rahman', email: 'abid@gmail.com',
                                phone: 786_189_455, gender: 'Male', photo: 'abid.jpg', hire_date: '2019-01-01', department_id: 1, user_id: 1)
    @attendance = Attendance.create(date: '2019-01-01', clock_in: '2019-01-01 08:00:00',
                                    clock_out: '2019-01-01 17:00:00', employee_id: @employee.id)
  end

  it 'should have date' do
    @attendance.date = '2019-01-01'
  end

  it 'should have clock in' do
    @attendance.clock_in = '2019-01-01 08:00:00'
  end

  it 'should have clock out' do
    @attendance.clock_out = '2019-01-01 17:00:00'
  end

  it 'should belong to employee' do
    attendance = Attendance.reflect_on_association(:employee)
    expect(attendance.macro).to eq(:belongs_to)
  end
end
