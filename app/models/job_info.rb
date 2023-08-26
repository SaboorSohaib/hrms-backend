class JobInfo < ApplicationRecord
  belongs_to :employee

  validates :job_title, :employee_id, presence: true
end
