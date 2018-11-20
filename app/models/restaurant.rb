class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :pictures, as: :imageable
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
end
