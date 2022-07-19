require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  describe 'GET index' do
    @first_user = User.create(name: 'John', photo: 'user-img.png', bio: 'Developer.', posts_counter: 0)
    @second_user = User.create(name: 'Mira', photo: 'user-img.png', bio: 'Web Developer.', posts_counter: 0)
    @third_user = User.create(name: 'Silla', photo: 'user-img.png', bio: 'Frontend Developer.', posts_counter: 0)
    let!(:user) { User.create(name: 'Sirra', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0) }

    scenario 'shows the right content' do
      visit users_path
      expect(page).to have_content('Number of posts')
    end

    feature 'User Index' do
      background { visit users_path }
      scenario 'See all usernames' do
        expect(page).to have_content('John')
        expect(page).to have_content('Mira')
        expect(page).to have_content('Silla')
      end

      scenario 'See the number of posts each user has written' do
        expect(page).to have_content('Number of posts:0')
      end

      scenario 'See profile picture for each user' do
        expect(page.first('img')['src']).to have_content \
          'user-img-6cd3d591e5bf0c523e69cd41cb477e1f1f93b196c19da72993501fdba413d9f5.png'
      end

      # scenario "When I click on a user, I am redirected to that user's show page" do
      #   click_link 'John', match: :first
      #   expect(current_path).to eq user_path(User.first.id)
      # end
    end
  end
end
