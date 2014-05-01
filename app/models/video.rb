class Video < ActiveRecord::Base

  validates :url, presence: true

  validates :description, presence: true
end
