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

  scenario "user sees error message when creating video without URL" do
    visit '/'
    within("#videos") do
      click_on 'View All'
    end
    click_on 'New Video'
    fill_in 'description', with: "Tarkan"
    click_on 'Create Video'
    expect(page).to have_content("Url can't be blank")
  end

  scenario 'user should see the link for all the videos' do
    visit '/'
    within('#videos') do
      click_on 'Add New'
    end
    fill_in 'url', with: "https://www.youtube.com/watch?v=H6WRZ8iBQzQ"
    fill_in 'description', with: "People Are Awesome"
    click_on 'Create Video'
    expect(page).to have_content('https://www.youtube.com/watch?v=H6WRZ8iBQzQ')

    visit '/'
    click_on 'all videos'
    expect(page).to have_content('https://www.youtube.com/watch?v=H6WRZ8iBQzQ')
  end

end
