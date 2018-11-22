class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :writter, class_name: 'User'

  def blank_stars
    5 - self.stars
  end
end
