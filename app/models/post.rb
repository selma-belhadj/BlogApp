class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :like

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.update_posts_counter
    user.update(posts_counter: user.post.count)
  end

  def self.five_recent_comments
    comment.includes(:post).order(created_at: :desc).limit(5)
  end
end
