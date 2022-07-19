require 'rails_helper'
RSpec.describe 'Testing post index page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Sirra', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Kenya.', posts_counter: 0)
    @post1 = Post.create(user: @user1, title: 'Sirra title', text: 'This is my first post', likes_counter: 0,
                         comments_counter: 0)
    visit(user_posts_path(@user1))
  end
  describe 'View posts' do
    scenario 'I can see the posts title.' do
      expect(page).to have_content 'Sirra title'
    end
    scenario 'I can see who wrote the post' do
      expect(page).to have_content 'Sirra'
    end
    scenario 'I can see the post text.' do
      expect(page).to have_content 'This is my first post'
    end
    it 'Can see how many comments it has' do
      expect(page).to have_content 'Comments:0'
    end
    it 'Can see how many likes it has' do
      expect(page).to have_content 'Likes:0'
    end
    it 'if there is max 250 characters' do
      @post1.title = 'Testing'
      expect(@post1).to be_valid
    end
    it 'if likes counter is integer' do
      @post1.likes_counter = 5
      expect(@post1).to be_valid
    end
    it 'if likes counter greater than or equal to zero' do
      @post1.likes_counter = -9
      expect(@post1).to_not be_valid
    end
    it 'if comments counter greater than or equal to zero.' do
      @post1.comments_counter = -5
      expect(@post1).to_not be_valid
    end
  end
end
