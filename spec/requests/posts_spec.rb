require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Sirra', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
  let!(:post) do
    Post.create(user: user, title: 'Sirra title', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end

  describe 'GET /index' do
    before(:example) { get user_posts_path(user.id) }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders posts list view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Sirra title')
    end
  end

  describe 'GET /index' do
    before(:example) { get user_post_path(user.id, post) }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders posts list view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Create a new comment')
    end
  end
end
