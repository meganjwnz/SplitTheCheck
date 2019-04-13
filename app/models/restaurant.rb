class Restaurant < ApplicationRecord
  has_many :votes
  has_many :users

  validates :name, :address, presence: true, uniqueness: true

  def upvote_score
    votes.where(vote: "true").count
  end

  def downvote_score
    votes.where(vote: "false").count
  end

  # Increments downvotes
  # param: restaurant = current restaurant
  # param: downvotes = current number of downvotes
  def self.vote_no(restaurant, downvote)
	if(downvote == nil)
          downvote = 0
	end
	#restaurant.update(downvote: downvote + 1)
      end

  #Searches for restaurants in DB with that name and/or address
  def self.search_by(search_name, search_address)
    where("LOWER(name) LIKE :search_name", search_name: "%#{search_name.downcase}").where("LOWER(address) LIKE :search_address", search_address: "%#{search_address.downcase}")
  end

end
