require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  fixtures :restaurants

  test "restaurant is not valid without a unique name/address" do
	  restaurant = Restaurant.new(name: restaurants(:ruby).name,
				address: restaurants(:ruby).address)
	  refute restaurant.valid?
          assert_not_nil restaurant.errors[:name]
          assert_not_nil restaurant.errors[:address]
  end

  test "should produce search result" do
    @restaurant = restaurants(:ruby)
    @result = Restaurant.search_by(@restaurant.name, @restaurant.address)
    assert_equal(@result.to_a, [@restaurant])
  end

  test "should count upvotes for a restaurant" do
    @restaurant = restaurants(:ruby)
    Vote.upvote_restaurant(users(:example2), restaurants(:ruby), true)
    Vote.upvote_restaurant(users(:example), restaurants(:ruby), true)
    Vote.upvote_restaurant(users(:example3), restaurants(:ruby), false)
    assert_equal(2, @restaurant.upvote_score)
  end

  test "should count downvotes for a restaurant" do
    @restaurant = restaurants(:ruby)
    Vote.upvote_restaurant(users(:example2), restaurants(:ruby), true)
    Vote.upvote_restaurant(users(:example), restaurants(:ruby), true)
    Vote.upvote_restaurant(users(:example3), restaurants(:ruby), false)
    assert_equal(1, @restaurant.downvote_score)
  end
end
