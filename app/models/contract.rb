class Contract < ApplicationRecord
  belongs_to :employee

  validates :starting_date, :ending_date, :contract_type, :employee_id, presence: true
end
