require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :restaurants, :users, :votes, :favorites

  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:example)
    get new_restaurant_url
    assert_response :success
  end

  test "should not get new" do
    get new_restaurant_url
    assert_equal "/unauthenticated", path
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:example)
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should not edit restaurant" do
    get edit_restaurant_url(@restaurant)
    assert_equal "/unauthenticated", path
  end

end
