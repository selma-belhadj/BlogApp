require 'rails_helper'

RSpec.describe Like, type: :model do
  user_blog = User.create(name: 'Sarah', photo: 'unsplash.com/photos/BXCZi9smw78', bio: 'Tree the forest!',
                          posts_counter: 0)
  post_blog = Post.create(user: user_blog, title: 'Post', text: 'the forest!', comments_counter: 0, likes_counter: 0)
  let(:comment1) { Comment.new(user: user_blog, post: post_blog, text: 'c1') }

  context 'Comment model' do
    it 'Doesn\'t accept blank space as value for comments_counter' do
      post_blog.comments_counter = ' '
      expect(post_blog).to_not be_valid
    end

    it 'Doesn\'t accept float  as value for comments_counter' do
      post_blog.comments_counter = 3.9
      expect(post_blog).to_not be_valid
    end

    it 'Doesn\'t accept negative number as value for comments_counter' do
      post_blog.comments_counter = - 3
      expect(post_blog).to_not be_valid
    end

    it 'accept "comment_counter" as integer' do
      post_blog.comments_counter = 3
      expect(post_blog).to be_valid
    end
  end
end
