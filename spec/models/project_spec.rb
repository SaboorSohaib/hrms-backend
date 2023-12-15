require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    @department = Department.create(name: 'IT')
    @project = Project.create(name: 'Project 1', starting_date: '2020-02-10', ending_date: '2020-05-10', budget: 3000,
                              department_id: @department.id)
  end

  it 'should have name' do
    @project.name = 'Project 1'
  end

  it 'should have starting date' do
    @project.starting_date = '2020-02-10'
  end

  it 'should have ending date' do
    @project.ending_date = '2020-05-10'
  end

  it 'should have budget' do
    @project.budget = 3000
  end

  it 'should belong to department' do
    project = Project.reflect_on_association(:department)
    expect(project.macro).to eq(:belongs_to)
  end
end
