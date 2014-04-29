require 'spec_helper'
require 'capybara/rspec'

feature 'Video management' do
  context 'user can see all videos' do
    scenario "user clicks 'all videos'" do
      visit '/'
      within(:css, "#header_container") do
        click_on 'all videos'
      end
    end
    scenario "user clicks 'View all'" do
      visit '/'
      within(:css, ".videos") do
        click_on 'View all'
      end
    end
    after(:each) do
      click_on 'New Video'
      fill_in 'url', with: 'https://www.youtube.com/watch?v=jaMZ4lyteH0'
      fill_in 'description', with: 'Tarkan'
      fill_in 'rating', with: '5'
      expect(true).to eq false
    end
  end
end
