class Review < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :reviewable, polymorphic: true
end
