require 'spec_helper'
require 'capybara/rspec'


feature 'homepage' do
  scenario 'user can see app name on the homepage' do
    visit '/'

    expect(page).to have_content "Sparkling Hill Rails Media Manager"
  end
end