class Address < ApplicationRecord
  belongs_to :employee
  validates :province, :distract, presence: true
end
