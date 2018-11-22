class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_many :reservations, foreign_key: :chef_id
  has_one_attached :image

  def fullname
    [firstname, lastname].join(' ')
  end
end
