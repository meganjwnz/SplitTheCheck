class AddVoteToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :vote, :boolean
  end
end
