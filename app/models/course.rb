class Course < ApplicationRecord
  belongs_to :courses_plan
  belongs_to :post
end
