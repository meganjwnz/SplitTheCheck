require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:ruby)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Restaurants"
  end

  test "creating a Restaurant" do
    visit restaurants_url
    click_on "Add Restaurant"

    fill_in "Address", with: "123 System Test"
    fill_in "Name", with: "456 Tasty Test"
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "Address", with: @restaurant.address
    fill_in "Name", with: @restaurant.name
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  test "upvoting a Restaurant" do
    visit restaurants_url
    assert_selector('span.upvote', text: '0')
    click_on "Splits check", match: :first
    assert_selector('span.upvote', text: '1')
    click_on "Splits check", match: :first
    assert_selector('span.upvote', text: '2')
  end

  test "downvoting a Restaurant" do
    visit restaurants_url
    assert_selector('span.downvote', text: '0')
    click_on "Does NOT split check", match: :first
    assert_selector('span.downvote', text: '1')
    click_on "Does NOT split check", match: :first
    assert_selector('span.downvote', text: '2')
  end

  test "search for a Restaurant" do
    visit restaurants_url
    assert_selector('span', count: 6)
    fill_in "search_name", with: @restaurant.name
    fill_in "search_address", with: @restaurant.address
    click_on "Search"
    assert_selector('span', count: 2)
    assert_text @restaurant.name
  end

end
