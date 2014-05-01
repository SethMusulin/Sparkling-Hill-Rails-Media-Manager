class Picture < ActiveRecord::Base
  validates :url, presence: true
  validates :description, presence: true
end
