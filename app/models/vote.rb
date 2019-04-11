class Vote < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :user, uniqueness: { scope: :restaurant }
  validates :restaurant, uniqueness: { scope: :user }

end
