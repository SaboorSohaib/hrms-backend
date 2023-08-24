class Report < ApplicationRecord
  belongs_to :department

  validates :name, :description, :department_id, presence: true
end
