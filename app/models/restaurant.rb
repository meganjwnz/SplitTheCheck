class Restaurant < ApplicationRecord
validates :name, :address, presence: true

  # Increments upvotes
  # param: restaurant = current restaurant
  # param: upvote = current number of upvotes
  def self.vote_yes(restaurant, upvote)
	if(upvote == nil)
          upvote = 0
	end
	restaurant.update(upvote: upvote + 1)
  end

  # Increments downvotes
  # param: restaurant = current restaurant
  # param: downvotes = current number of downvotes
  def self.vote_no(restaurant, downvote)
	if(downvote == nil)
          downvote = 0
	end
	restaurant.update(downvote: downvote + 1)
      end
end
