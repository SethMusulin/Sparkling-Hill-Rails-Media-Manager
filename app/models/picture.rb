class Picture < ActiveRecord::Base
  validates :url, :format => {:with => /\A(http|https):\/\/.+(gif|png|jpeg|jpg)/,
                              :message => "must be valid"}

  validates :description, presence: true

  validates :rating, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0,
    message: "must be between 0 and 5"
  }
end
