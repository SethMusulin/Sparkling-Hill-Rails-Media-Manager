require 'spec_helper'
require 'capybara/rspec'

feature 'Video management' do
  context 'user can see all videos' do
    scenario "user clicks 'all videos'" do
      visit '/'
      within("#header_container") do
        click_on 'all videos'
      end
      click_on 'New Video'
      fill_in 'url', with: 'https://www.youtube.com/watch?v=jaMZ4lyteH0'
      fill_in 'description', with: 'Tarkan'
      fill_in 'rating', with: '5'
      click_on 'Create Video'
      expect(page).to have_content('https://www.youtube.com/watch?v=jaMZ4lyteH0')
    end
    scenario "user clicks 'View All'" do
      visit '/'
      within(".videos") do
        click_on 'View All'
      end
      click_on 'New Video'
      fill_in 'url', with: 'https://www.youtube.com/watch?v=jaMZ4lyteH0'
      fill_in 'description', with: 'Tarkan'
      fill_in 'rating', with: '5'
      click_on 'Create Video'
      expect(page).to have_content('https://www.youtube.com/watch?v=jaMZ4lyteH0')
    end
  end
end
