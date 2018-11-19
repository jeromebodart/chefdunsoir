class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  belongs_to :reviewable, polymorphic: true
end
