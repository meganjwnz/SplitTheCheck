class Restaurant < ApplicationRecord
validates :name, :address, presence: true

  def increment_upvote
    Restaurant.upvote + 1
  end

end
