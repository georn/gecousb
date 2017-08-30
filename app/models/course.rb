class Course < ApplicationRecord
  # belongs_to :courses_plan
  has_many :posts

  validates :code, presence: true
  validates :department, presence: true
end
