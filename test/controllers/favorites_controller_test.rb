require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :restaurants, :users

  #creates an upvote and send back to restaurant page
  test "should create new favorite" do
     sign_in users(:example)
     get restaurants_url
     post favorites_favorite_restaurant_path, params: { user: users(:example), restaurant: restaurants(:one).id }
     assert_redirected_to "/restaurants"
  end

  #does not allow unauthorized user to access upvotes
  test "should get not favorite when not signed in" do
     get restaurants_url
     post favorites_favorite_restaurant_path, params: { restaurant: restaurants(:one).id }
     assert_equal "/unauthenticated", path
  end
end
