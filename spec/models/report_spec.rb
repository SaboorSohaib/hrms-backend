require 'rails_helper'

RSpec.describe Report, type: :model do
  before(:each) do
    @department = Department.create(name: 'IT')
    @report = Report.create(name: 'Report 1', description: 'Report for IT department', department_id: @department.id)
  end

  it 'should have name' do
    @report.name = 'Report 1'
  end

  it 'should have description' do
    @report.description = 'Report for IT department'
  end

  it 'should belong to department' do
    report = Report.reflect_on_association(:department)
    expect(report.macro).to eq(:belongs_to)
  end
end
