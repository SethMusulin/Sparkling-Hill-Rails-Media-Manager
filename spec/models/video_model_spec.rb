require 'spec_helper'

describe 'validations' do
   it 'video url must not be blank' do
     video = Video.create!(:url => 'https://www.youtube.com/watch?v=GaazsvAbtQk', :description => "Turkish", :rating => 3)
     video.url = ""

     expect(video).to_not be_valid
   end

   it 'video description must not be blank' do
     video = Video.create!(:url => 'https://www.youtube.com/watch?v=GaazsvAbtQk', :description => "Turkish", :rating => 3)
     video.description = ""

     expect(video).to_not be_valid
   end

   it 'Rating must between 1 and 5' do
     video = Video.create!(:url => 'https://www.youtube.com/watch?v=GaazsvAbtQk', :description => "Turkish", :rating => 3)
     video.rating = ""

     expect(video).to_not be_valid
   end


end