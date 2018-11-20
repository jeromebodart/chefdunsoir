class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
end
