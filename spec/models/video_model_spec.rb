require 'spec_helper'

describe 'validations' do
   it 'video url must not be blank' do
     video = Video.create!(:url => 'https://www.youtube.com/watch?v=jaMZ4lyteH0', :description => "Turkish")
     video.url = ""

     expect(video).to_not be_valid
   end

   it 'video url must not be blank' do
     video = Video.create!(:url => 'https://www.youtube.com/watch?v=jaMZ4lyteH0', :description => "Turkish")
     video.description = ""

     expect(video).to_not be_valid
   end


end