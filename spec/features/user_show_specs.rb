require 'rails_helper'
RSpec.describe 'Testing user index page', type: :feature do
  let!(:user) { User.new(name: 'John', photo: 'user-img.png', bio: 'Developer.', posts_counter: 0) }
  describe 'GET index' do
    feature 'User Index' do
      background { visit user_path(User.find_by(name: 'John')) }
      scenario 'shows the right content' do
        visit users_path
        expect(page).to have_content('Number of posts')
      end
      scenario "I can see the user's username" do
        expect(page).to have_content('John')
      end
      scenario "I can see the user's bio" do
        expect(page).to have_content('Create new post')
      end
      scenario "I can see a button that lets me view all of a user's posts" do
        click_link('See all posts')
        expect(current_path).to eq user_posts_path(User.find_by(name: 'John'))
      end
    end
  end
end
