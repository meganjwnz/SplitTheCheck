class Restaurant < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes

  validates :name, :address, presence: true, uniqueness: true
  before_save :default_values

  def self.votes_in_favor
    votes.count
  end

  #Adds default value to upvote and downvote
  def default_values
    self.upvote = 0 if self.upvote.nil?
    self.downvote= 0 if self.downvote.nil?
    votes.count = 0 if votes.nil?
  end

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

  #Searches for restaurants in DB with that name and/or address
  def self.search_by(search_name, search_address)
    where("LOWER(name) LIKE :search_name", search_name: "%#{search_name.downcase}").where("LOWER(address) LIKE :search_address", search_address: "%#{search_address.downcase}")
  end

end
