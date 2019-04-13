class RemoveDownvoteFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :downvote, :integer
  end
end
