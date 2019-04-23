class Favorite < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :user, uniqueness: { scope: :restaurant }
  validates :restaurant, uniqueness: { scope: :user }

  def self.favorite_restaurant(user, restaurant, favorite)
    Favorite.create(:restaurant => restaurant, :user => user, :favorite => favorite)
  end
end
