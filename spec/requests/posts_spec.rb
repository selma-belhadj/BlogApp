require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders posts list view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Here is a list of all posts for a given user based on the given user_id')
    end
  end

  describe 'GET /index' do
    before(:example) { get user_post_path(1, 1) }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders posts list view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Here is the details of the given post for the given user')
    end
  end
end
