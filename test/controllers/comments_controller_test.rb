require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :restaurants, :users, :favorites, :comments

  setup do
    @comment = comments(:one)
  end

  #does not allow unauthorized user to access upvotes
  test "should not allow comments when not signed in" do
     get new_comment_url
     assert_equal "/unauthenticated", path
  end

end
