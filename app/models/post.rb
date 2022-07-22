class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :comment, class_name: 'Comment', foreign_key: :post_id, dependent: :destroy
  has_many :like, class_name: 'Like', foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :update_posts_counter

  def update_posts_counter
    user.update(posts_counter: user.post.count)
  end

  def five_recent_comments
    comment.includes(:post).order(created_at: :desc).limit(5)
  end
end
