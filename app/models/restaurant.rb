class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
end
