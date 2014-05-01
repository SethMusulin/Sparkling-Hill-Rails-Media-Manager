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
      within("#videos") do
        click_on 'View All'
      end
      click_on 'New Video'
      fill_in 'url', with: 'https://www.youtube.com/watch?v=jaMZ4lyteH0'
      fill_in 'description', with: 'Tarkan'
      fill_in 'rating', with: '5'
      click_on 'Create Video'
      expect(page).to have_content('https://www.youtube.com/watch?v=jaMZ4lyteH0')
      expect(page).to have_content '5'
      expect(page).to have_content 'Tarkan'
      expect(page).to have_content 'Video Successfully Created'
      click_on "all videos"
      click_on "https://www.youtube.com/watch?v=jaMZ4lyteH0"
      expect(page).to_not have_content 'Video successfully created'
    end
  end

  scenario "user sees error message when creating video without Description" do
    visit '/'
    within("#videos") do
      click_on 'View All'
    end
    click_on 'New Video'
    fill_in 'url', with: 'https://www.youtube.com/watch?v=jaMZ4lyteH0'
    click_on 'Create Video'
    expect(page).to have_content("Description can't be blank")
  end

  context 'create video' do
    before(:each) do
      visit '/'
      within("#videos") do
        click_on 'View All'
      end
      click_on 'New Video'
    end
    scenario "user sees error message when creating video without URL" do
      fill_in 'description', with: "Tarkan"
      click_on 'Create Video'
      expect(page).to have_content("Url can't be blank")
    end

    scenario 'user should see the link for all the videos' do
      fill_in 'url', with: "https://www.youtube.com/watch?v=H6WRZ8iBQzQ"
      fill_in 'description', with: "People Are Awesome"
      fill_in 'rating', with: 3
      click_on 'Create Video'
      visit '/'
      click_on 'all videos'
      expect(page).to have_content('https://www.youtube.com/watch?v=H6WRZ8iBQzQ')
    end

    scenario 'user should be able to see an edit form for a video' do
      fill_in 'url', with: "https://www.youtube.com/watch?v=H6WRZ8iBQzQ"
      fill_in 'description', with: "People Are Awesome"
      fill_in 'rating', with: 3
      click_on 'Create Video'
      click_on "Edit"
      fill_in 'description', with: "Awesome Are People"
      click_on "Update Video"
      expect(page).to have_content "Awesome Are People"
      expect(page).to_not have_content "People Are Awesome"
      expect(page).to have_content 'Video Successfully Updated'
    end

    scenario 'User cant rate a video higher than 5 or less than 0' do
      fill_in 'url', with: "https://www.youtube.com/watch?v=H6WRZ8iBQzQ"
      fill_in 'description', with: "People Are Awesome"
      fill_in 'rating', with: "zmldhvkjlasgdflka"
      click_on 'Create Video'
      # expect(page).to have_content("Url can't be blank")
    end

    scenario 'user can delete a video' do
      fill_in 'url', with: "https://www.youtube.com/watch?v=H6WRZ8iBQzQ"
      fill_in 'description', with: "People Are Awesome"
      fill_in 'rating', with: 3
      click_on 'Create Video'
      click_on 'Delete Video'
      expect(page).to have_content("Video Successfully Deleted")
      expect(page).to_not have_content("https://www.youtube.com/watch?v=H6WRZ8iBQzQ")
    end
  end
end
