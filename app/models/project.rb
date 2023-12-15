class Project < ApplicationRecord
  belongs_to :department

  validates :name, :starting_date, :ending_date, :budget, :department_id, presence: true
end
