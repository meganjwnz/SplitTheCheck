require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  fixtures :restaurants

  test "restaurant is not valid without a unique name/address" do
	  restaurant = Restaurant.new(name: restaurants(:ruby).name,
				address: restaurants(:ruby).address,
				upvote: 0,
				downvote: "0")
	  refute restaurant.valid?
          assert_not_nil restaurant.errors[:name]
          assert_not_nil restaurant.errors[:address]
  end

  test "default upvote/downvote is 0" do
    restaurant = Restaurant.new(name: restaurants(:ruby).name,
				address: restaurants(:ruby).address)
    restaurant.default_values
    assert_equal(0, restaurant.upvote)
    assert_equal(0, restaurant.downvote)
  end

  test "upvote increases by 1" do
    restaurant = Restaurant.new(name: restaurants(:ruby).name,
				address: restaurants(:ruby).address)
    restaurant.default_values
    assert_equal(0, restaurant.upvote)
    Restaurant.vote_yes(restaurant, restaurant.upvote)
    assert_equal(1, restaurant.upvote)
    Restaurant.vote_yes(restaurant, restaurant.upvote)
    assert_equal(2, restaurant.upvote)
  end

  test "downvote increases by 1" do
    restaurant = Restaurant.new(name: restaurants(:ruby).name,
				address: restaurants(:ruby).address)
    restaurant.default_values
    assert_equal(0, restaurant.downvote)
    Restaurant.vote_no(restaurant, restaurant.downvote)
    assert_equal(1, restaurant.downvote)
    Restaurant.vote_no(restaurant, restaurant.downvote)
    assert_equal(2, restaurant.downvote)
  end

  test "should produce search result" do
    @restaurant = restaurants(:ruby)
    @result = Restaurant.search_by(@restaurant.name, @restaurant.address)
    assert_equal(@result.to_a, [@restaurant])
  end

end
