class Course < ApplicationRecord
  has_and_belongs_to_many :terms
  has_many :posts

  validates :code, presence: true
  validates :department, presence: true
end
