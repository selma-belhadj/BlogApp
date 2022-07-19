require 'rails_helper'

RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Sirra', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Kenya.', posts_counter: 0)
    @post1 = Post.create(user: @user1, title: 'Sirra title', text: 'This is my first post', likes_counter: 0,
                         comments_counter: 0)
    @comment1 = Comment.create(text: 'My first comment', user: @user1, post: @post1)
    @comment2 = Comment.create(text: 'My second comment', user: @user1, post: @post1)
    @like1 = Like.create(user_id: @user1.id, post_id: @post1.id)
    visit user_post_path(@user1, @post1)
  end

  describe 'Specs for view posts#show' do
    it 'Can see the posts title.' do
      expect(page).to have_content 'Sirra title'
    end
  end

  it 'Can see who wrote the post' do
    expect(page).to have_content 'Sirra'
  end

  it 'Can see how many comments it has' do
    expect(page).to have_content 'Comments:2'
  end
end
