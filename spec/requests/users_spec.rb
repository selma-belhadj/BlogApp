require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders users list view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET /show' do
    let!(:user) { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }
    before(:example) { get user_path(user.id) }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders user detail view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('See all posts')
    end
  end
end
