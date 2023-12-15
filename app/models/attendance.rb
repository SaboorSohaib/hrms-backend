class Attendance < ApplicationRecord
  belongs_to :employee

  validates :date, :clock_in, :clock_out, :employee_id, presence: true
  # validates :clock_in, :clock_out, format: { with: /\A\d{2}:\d{2}\z/, message: 'should be in HH:MM format' }
end
