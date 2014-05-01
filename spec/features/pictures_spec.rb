require 'spec_helper'
require 'capybara/rspec'

feature 'Pictures manager' do
  scenario 'User can add and edit a photo' do
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
    expect(page).to have_content("Picture Successfully Created!")

    click_on "Edit"
    fill_in "picture[description]", with: "kittens"
    fill_in "picture[rating]", with: "3"
    click_on "Update Picture"
    expect(page).to have_content "http://critterbabies.com/wp-content/uploads/2013/11/kittens-300x199.jpg"
    expect(page).to have_content "kittens"
    expect(page).to have_content "3"

    click_on "Delete"
    expect(page).to_not have_content "http://critterbabies.com/wp-content/uploads/2013/11/kittens-300x199.jpg"
    expect(page).to have_content("Picture Successfully Deleted!")
  end
end


