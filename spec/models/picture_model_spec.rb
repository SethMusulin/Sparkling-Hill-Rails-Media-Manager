require 'spec_helper'

describe 'validations' do
  it 'picture url must not be blank' do
    video = Picture.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish")
    video.url = ""
    expect(video).to_not be_valid
  end

  it 'picture description must not be blank' do
    video = Picture.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish")
    video.description = ""

    expect(video).to_not be_valid
  end


end