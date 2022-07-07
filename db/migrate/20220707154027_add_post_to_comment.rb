class AddPostToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :posts, foreign_key: true
  end
end
