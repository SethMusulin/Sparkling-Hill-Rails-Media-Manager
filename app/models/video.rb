class Video < ActiveRecord::Base

  validates :url, presence: true

  validates :description, presence: true

  validates :rating, numericality: true
end
