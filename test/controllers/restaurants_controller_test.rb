require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  fixtures :restaurants

  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should set upvote defaults" do
    get restaurants_url
    assert_equal nil, assigns(:upvote)
    post restaurants_upvote_url
    assert_equal 0, assigns(:upvote)
  end

  test "should set downvote defaults" do
    get restaurants_url
    assert_equal nil, assigns(:downvote)
    post restaurants_downvote_url
    assert_equal 0, assigns(:downvote)
  end
end
