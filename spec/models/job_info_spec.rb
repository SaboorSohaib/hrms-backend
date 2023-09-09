require 'rails_helper'

RSpec.describe JobInfo, type: :model do
  before(:each) do
    @employee = Employee.create(first_name: 'Abid', last_name: 'Rahman', email: 'abid@gmail.com',
                                phone: 786_189_455, gender: 'Male', photo: 'abid.jpg', hire_date: '2019-01-01', department_id: 1, user_id: 1)
    @job_info = JobInfo.create(job_title: 'Software Engineer', employee_id: @employee.id)
  end

  it 'should have job title' do
    @job_info.job_title = 'Software Engineer'
  end

  it 'should belong to employee' do
    job_info = JobInfo.reflect_on_association(:employee)
    expect(job_info.macro).to eq(:belongs_to)
  end
end
