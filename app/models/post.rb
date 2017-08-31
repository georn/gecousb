class Post < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user, presence: true
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :course, presence: true
  validates :content, presence: true
end
