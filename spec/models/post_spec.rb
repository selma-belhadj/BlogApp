require 'rails_helper'

RSpec.describe Post, type: :model do
  user_blog = User.create(
    name: 'Sarah',
    photo: 'https://unsplash.com/photos/BXCZi9smw78',
    bio: 'Hand hanging a leif inside the forest!',
    posts_counter: 0
  )

  post_blog = Post.new(
    user: user_blog,
    title: 'Sarah\s Post',
    text: 'Beautiful House in the middle of the forest!',
    comments_counter: 0,
    likes_counter: 0 
  )

  context 'Post.title value' do
    it 'Doesn\'t accept nil as value for title' do
      post_blog.title = nil
      expect(post_blog).to_not be_valid
    end 

    it 'Doesn\'t accept blank space as value for title' do
      post_blog.title = '  '
      expect(post_blog).to_not be_valid
    end 

    it 'Doesn\'t accept long string (>250 char) as value for title' do
      post_blog.title = 'Model specs are a great way to double-check that your inputs will be saved appropriately and only when they are expected to. Following BDD or TDD, if you write your expectations in tests you can be certain your database is protected from unexpected entries.'
      expect(post_blog).to_not be_valid
    end 

    it 'accept Sarah\'s Post as value for title' do
      post_blog.title = 'Post of Sarah'
      expect(post_blog).to be_valid
    end 
  end

  context 'Post.comments_counter value' do
  
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

    it 'accept "comments_counter" as integer' do
      post_blog.comments_counter = 3
      expect(post_blog).to be_valid
    end 
  end

  context 'Post.likes_counter value' do
    it 'Doesn\'t accept blank space as value for posts_counter' do
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
