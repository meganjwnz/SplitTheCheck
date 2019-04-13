class Vote < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :user, uniqueness: { scope: :restaurant }
  validates :restaurant, uniqueness: { scope: :user }

  def self.upvote_restaurant(user, restaurant, vote)
    Vote.create(:user => user, :restaurant => restaurant, :vote => vote)
  end

  def self.downvote_restaurant(user, restaurant, vote)
    Vote.create(:user => user, :restaurant => restaurant, :vote => vote)
  end

end
