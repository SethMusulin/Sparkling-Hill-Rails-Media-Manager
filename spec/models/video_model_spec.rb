require 'spec_helper'

describe 'validations' do
   it 'video url must not be blank' do
     video = Video.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish", :rating => 3)
     video.url = ""

     expect(video).to_not be_valid
   end

   it 'video description must not be blank' do
     video = Video.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish", :rating => 3)
     video.description = ""

     expect(video).to_not be_valid
   end

   it 'Rating must between 1 and 5' do
     video = Video.create!(:url => 'http://static.gamespot.com/uploads/original/mig/2/7/3/9/2042739-710743_20130611_006.jpg', :description => "Turkish", :rating => 3)
     video.rating = ""

     expect(video).to_not be_valid
   end


end