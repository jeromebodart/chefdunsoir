class Reservation < ApplicationRecord
  belongs_to :chef, class_name: 'User'
  belongs_to :restaurant
  validates :date, presence: true
end
