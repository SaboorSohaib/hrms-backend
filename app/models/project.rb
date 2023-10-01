class Project < ApplicationRecord
  belongs_to :department

  validates :name, :starting_date, :ending_date, :duration, :department_id, presence: true
end
