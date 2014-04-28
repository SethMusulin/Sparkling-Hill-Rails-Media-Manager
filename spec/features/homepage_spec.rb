require 'spec_helper'
require 'capybara/rspec'


feature 'homepage' do
  scenario 'user can see app name on the homepage' do
    visit '/'

    expect(page).to have_content 'Media Manager'
    click_link 'all pictures'
    expect(page).to have_content 'Pictures'
    click_link 'all videos'
    expect(page).to have_content 'Videos'
  end
end