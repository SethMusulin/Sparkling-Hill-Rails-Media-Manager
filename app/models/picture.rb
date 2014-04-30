class Picture < ActiveRecord::Base
  validates :url,
            length: {
              minimum: 4,
              message: "URL cannot be blank"
            }
  validates :description,
            length: {
              minimum: 3,
              message: "Description cannot be blank"
            }
end
