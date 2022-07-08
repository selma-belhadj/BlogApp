class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :like

  def update_posts_counter
    user.update(posts_counter: user.post.count)
  end

  def five_recent_comments
    comment.includes(:post).order(created_at: :desc).limit(5)
  end
end
