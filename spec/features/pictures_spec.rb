require 'spec_helper'
require 'capybara/rspec'

feature 'Pictures manager' do

  scenario 'User can add a photo' do
    visit '/'
    within("#pictures") do
      click_on "Add New"
    end
    fill_in "picture[url]", with: "http://critterbabies.com/wp-content/uploads/2013/11/kittens-300x199.jpg"
    fill_in "picture[description]", with: "Critter Babbies"
    fill_in "picture[rating]", with: "5"
    click_on "Create Picture"
    expect(page).to have_css("img")
    expect(page).to have_content("Critter Babbies")
    expect(page).to have_content("5")
    expect(page).to have_content("Picture successfully created!")
  end
end


