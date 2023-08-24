class Employee < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_one :job_info, dependent: :destroy
  has_many :salaries, dependent: :destroy
  belongs_to :department
  belongs_to :user

  validates :first_name, :last_name, :email, :phone, :gender, :hire_date, :department_id,
            :user_id, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: { only_integer: true }
  validates :first_name, :last_name, length: { minimum: 3 }
end
