require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :restaurants, :users

  test "should get new upvote" do
     sign_in users(:example)
     get restaurants_url
     post votes_upvote_restaurant_path, params: { user: users(:example), restaurant: restaurants(:one).id }
     assert_redirected_to "/restaurants"
  end

  test "should get new downvote" do
     sign_in users(:example)
     get restaurants_url
     post votes_downvote_restaurant_path, params: { user: users(:example), restaurant: restaurants(:one).id }
     assert_redirected_to "/restaurants"
  end

  test "should get not new upvote when not signed in" do
     get restaurants_url
     post votes_upvote_restaurant_path, params: { restaurant: restaurants(:one).id }
     assert_equal "/unauthenticated", path
  end

  test "should get not new downvote when not signed in" do
     get restaurants_url
     post votes_downvote_restaurant_path, params: { restaurant: restaurants(:one).id }
     assert_equal "/unauthenticated", path
  end
end
