require 'rails_helper'

RSpec.describe User, type: :model do
  user_blog = User.new(
    name: 'Sarah',
    photo: 'https://unsplash.com/photos/BXCZi9smw78',
    bio: 'Hand hanging a leif inside the forest!',
    posts_counter: 0
  )

  context 'User.name value' do
    it 'Doesn\'t accept nil as value for name' do
      user_blog.name = nil
      expect(user_blog).to_not be_valid
    end

    it 'Doesn\'t accept blank space as value for name' do
      user_blog.name = '  '
      expect(user_blog).to_not be_valid
    end

    it 'accept "Sarah" as name' do
      user_blog.name = 'Sarah'
      expect(user_blog).to be_valid
    end
  end

  context 'User.posts_counter value' do
    it 'Doesn\'t accept blank space as value for posts_counter' do
      user_blog.posts_counter = ' '
      expect(user_blog).to_not be_valid
    end

    it 'Doesn\'t accept float  as value for posts_counter' do
      user_blog.posts_counter = 3.9
      expect(user_blog).to_not be_valid
    end

    it 'Doesn\'t accept negative number as value for posts_counter' do
      user_blog.posts_counter = - 3
      expect(user_blog).to_not be_valid
    end

    it 'accept "posts_counter" as integer' do
      user_blog.posts_counter = 3
      expect(user_blog).to be_valid
    end
  end

  context 'User.three_recent_posts' do
    let(:the_user_blog) { User.create!(name: 'Sarah', photo: 'https://unsplash.com/photos/BXCZi9smw78', bio: 'Hand hanging a leif inside the forest!', posts_counter: 0) }
    let(:post1) { Post.new(title: 'post 1', user: the_user_blog, text: 't', comments_counter: 0, likes_counter: 0) }
    let(:post2) { Post.new(title: 'post 2', user: the_user_blog, text: 't', comments_counter: 0, likes_counter: 0) }
    let(:post3) { Post.new(title: 'post 3', user: the_user_blog, text: 't', comments_counter: 0, likes_counter: 0) }
    let(:post4) { Post.new(title: 'post 4', user: the_user_blog, text: 't', comments_counter: 0, likes_counter: 0) }

    it 'returns nothing without any posts' do
      posts_count = the_user_blog.three_recent_posts.count
      expect(posts_count).to be 0
    end

    it 'returns one saved post for the posts_count value' do
      post1.save!
      posts_count = the_user_blog.three_recent_posts.count
      expect(posts_count).to be 1
    end

    it 'accept "three_recent_posts" as integer' do
      post2.save!
      post3.save!
      post4.save!

      posts = the_user_blog.three_recent_posts
      posts_count = posts.count
      titles = posts.pluck(:title)

      expect(posts_count).to be 3
      expect(titles).to eq [post4.title, post3.title, post2.title]
    end
  end
end
