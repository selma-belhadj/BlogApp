class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comments_counter
    post.update(comments_counter: post.comment.count)
  end
end
