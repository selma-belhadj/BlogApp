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

  let(:comment1) { Comment.new(user: user_blog, post: post_blog, text: 'c1') }
  let(:comment2) { Comment.new(user: user_blog, post: post_blog, text: 'c2') }
  let(:comment3) { Comment.new(user: user_blog, post: post_blog, text: 'c3') }
  let(:comment4) { Comment.new(user: user_blog, post: post_blog, text: 'c4') }
  let(:comment5) { Comment.new(user: user_blog, post: post_blog, text: 'c5') }
  let(:comment6) { Comment.new(user: user_blog, post: post_blog, text: 'c6') }

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
      post_blog.title = 'Model specs are a great way to double-check.' * 10
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

  context 'Post.five_recent_comments' do
    it 'returns nothing without any comments' do
      comments_count = post_blog.five_recent_comments.count
      expect(comments_count).to be 0
    end

    it 'returns empty list if there is no comments' do
      expect(post_blog.five_recent_comments).to eq []
    end

    it 'returns recent five comments in right order' do
      comment1.save!
      comment2.save!
      comment3.save!
      comment4.save!
      comment5.save!
      comment6.save!

      post_blog.reload
      actual_comments = post_blog.five_recent_comments.pluck(:text)
      expected_comments = [
        comment6.text,
        comment5.text,
        comment4.text,
        comment3.text,
        comment2.text
      ]
      expect(actual_comments).to eq expected_comments
    end
  end
end
