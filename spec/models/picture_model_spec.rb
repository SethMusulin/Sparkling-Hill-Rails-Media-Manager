require 'spec_helper'

describe 'validations' do
  it 'picture url must not be blank' do
    picture = Picture.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish", :rating => 3)
    picture.url = ""
    expect(picture).to_not be_valid
  end

  it 'picture description must not be blank' do
    picture = Picture.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish", :rating => 3)
    picture.description = ""

    expect(picture).to_not be_valid
  end

  it 'Rating must between 1 and 5' do
    picture = Picture.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish", :rating => 3)
    picture.rating = ""

    expect(picture).to_not be_valid
  end
end