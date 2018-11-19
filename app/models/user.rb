class User < ApplicationRecord
  has_many :reviews, as: :reviewable
end
