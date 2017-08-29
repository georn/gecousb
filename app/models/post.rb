class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true # post.errors[:users] => ["must exist, can't be blank"] double validation needed?
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :course, presence: true
  validates :content, presence: true
end
