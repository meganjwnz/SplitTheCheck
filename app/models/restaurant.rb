class Restaurant < ApplicationRecord
  has_many :votes
  has_many :users
  has_many :comments
  has_many :favorites
  validates :name, :address, presence: true, uniqueness: true

  def upvote_score
    votes.where(vote: "true").count
  end

  def downvote_score
    votes.where(vote: "false").count
  end

  def favorites_status(user_id)
    favs = favorites.where(favorite: "true", user: user_id).count
    if (favs == 1)
      return true;
    else
      return false;
    end
  end

  #Searches for restaurants in DB with that name and/or address
  def self.search_by(search_name, search_address)
    where("LOWER(name) LIKE :search_name", search_name: "%#{search_name.downcase}").where("LOWER(address) LIKE :search_address", search_address: "%#{search_address.downcase}")
  end

end
