class Course < ApplicationRecord
  belongs_to :courses_plan
  belongs_to :post

  validates :code, presence: true
  validates :department, presence: true
  validates :careers, presence: true
end
