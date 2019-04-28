require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:ruby)
    @comment = comments(:one)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Restaurants"
  end

  test "creating a Restaurant" do
    sign_in users(:example)
    visit restaurants_url
    click_on "Add Restaurant"

    fill_in "Address", with: "123 System Test"
    fill_in "Name", with: "456 Tasty Test"
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    sign_in users(:example)
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "Address", with: @restaurant.address
    fill_in "Name", with: @restaurant.name
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  test "upvoting a Restaurant" do
    sign_in users(:example)
    visit restaurants_url
    assert_selector('span.upvote', text: '0')
    click_on "Splits check", match: :first
    assert_selector('span.upvote', text: '1')
    click_on "Splits check", match: :first
    assert_selector('span.upvote', text: '1')
    
    sign_out users(:example)
    sign_in users(:example2)
    click_on "Splits check", match: :first
    assert_selector('span.upvote', text: '2')
  end

  test "downvoting a Restaurant" do
    sign_in users(:example)
    visit restaurants_url
    assert_selector('span.downvote', text: '0')
    click_on "Does NOT split check", match: :first
    assert_selector('span.downvote', text: '1')
    click_on "Does NOT split check", match: :first
    assert_selector('span.downvote', text: '1')
    
    sign_out users(:example)
    sign_in users(:example2)
    click_on "Does NOT split check", match: :first
    assert_selector('span.downvote', text: '2')
  end

  test "search for a Restaurant" do
    sign_in users(:example)
    visit restaurants_url
    assert_selector('span', count: 6)
    fill_in "search_name", with: @restaurant.name
    fill_in "search_address", with: @restaurant.address
    click_on "Search"
    assert_selector('span', count: 2)
    assert_text @restaurant.name
  end

  #tests commenting on a restaurant
  test "comment on a restaurant" do
    sign_in users(:example)
    visit restaurants_url
    click_on "Add Comment", match: :first
    fill_in "Comment", with: @comment.comment
    click_on "Create Comment"
  end

  #tests adding favorite
  test "favorite a restaurant" do
    sign_in users(:example)
    visit restaurants_url
    click_on "Favorite?", match: :first
    assert_text "One of your favorites!"
  end

  test "view profile without any comments/votes/favorites" do
    sign_in users(:example)
    visit restaurants_url
    click_on "View Profile"
    assert_text "example@example.com"
    assert_text "I haven't made any comments! :("
    assert_text "I haven't made any votes! :("
    assert_text "I haven't selected any favorites! :("
  end

  test "view profile with comments/votes/favorites" do
    sign_in users(:example)
    visit restaurants_url

    click_on "Add Comment", match: :first
    fill_in "Comment", with: @comment.comment
    click_on "Create Comment"
    click_on "Back"

    click_on "Favorite?", match: :first

    click_on "Splits check", match: :first

    click_on "View Profile"
    assert_text "example@example.com"
    assert_text "MyStringz"
    assert_text "* Fancy Restaurant splits checks"
    assert_text "* Fancy Restaurant"
  end

  test "follow restaurant link in profile" do
    sign_in users(:example)
    visit restaurants_url

    click_on "Favorite?", match: :first

    click_on "View Profile"
    click_on "Fancy Restaurant"
    assert_text "Restaurant Name: Fancy Restaurant"
    assert_text "Restaurant Address: 123 Expensive Address"
  end
end
