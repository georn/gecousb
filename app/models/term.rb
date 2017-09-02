class Term < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :courses

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
end
