class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :post, class_name: 'Post'
  after_save :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comment.count)
  end
end
