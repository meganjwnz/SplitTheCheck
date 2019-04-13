class RemoveUpvoteFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :upvote, :integer
  end
end
