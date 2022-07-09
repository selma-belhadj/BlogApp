class User < ApplicationRecord
  has_many :post
  has_many :comment
  has_many :like

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    post.includes(:user).order(created_at: :desc).limit(3)
  end
end
