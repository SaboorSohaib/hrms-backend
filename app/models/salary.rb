class Salary < ApplicationRecord
  belongs_to :employee

  validates :salary_amount, :month, :employee_id, presence: true
end
