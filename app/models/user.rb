class User < ApplicationRecord
  has_many :post
  has_many :comment
  has_many :like

  def three_recent_posts
    post.includes(:user).order(created_at: :desc).limit(3)
  end
end
