class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :writter, class_name: 'User'
end
