class Department < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :name, presence: true
end
