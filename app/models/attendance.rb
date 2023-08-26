class Attendance < ApplicationRecord
  belongs_to :employee

  validates :date, :clock_in, :clock_out, :employee_id, presence: true
end
