require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  fixtures :restaurants, :users, :votes

  #creates an upvote where a true = upvote
   test "should create favorite" do
     @favorite = Favorite.favorite_restaurant(users(:example), restaurants(:one), true)
     assert_equal(true, @favorite.favorite)
  end
end
