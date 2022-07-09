require 'rails_helper'

RSpec.describe Like, type: :model do
  user_blog = User.create(name: 'Sarah', photo: 'https://unsplash.com/photos/BXCZi9smw78',
                          bio: 'Hand hanging a leif inside the forest!', posts_counter: 0)
  post_blog = Post.create(user: user_blog, title: 'Post for Sarah', text: 'House in the middle of the forest!',
                          comments_counter: 0, likes_counter: 0)
  let(:like_blog) { Like.new(user: user_blog, post: post_blog) }

  context 'Like model' do
    it 'Doesn\'t accept blank space as value for likes_counter' do
      post_blog.likes_counter = ' '
      expect(post_blog).to_not be_valid
    end

    it 'Doesn\'t accept float  as value for likes_counter' do
      post_blog.likes_counter = 3.9
      expect(post_blog).to_not be_valid
    end

    it 'Doesn\'t accept negative number as value for likes_counter' do
      post_blog.likes_counter = - 3
      expect(post_blog).to_not be_valid
    end

    it 'accept "likes_counter" as integer' do
      post_blog.likes_counter = 3
      expect(post_blog).to be_valid
    end
  end
end
