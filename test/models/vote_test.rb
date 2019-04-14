require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  fixtures :restaurants, :users, :votes

  #creates an upvote where a true = upvote
   test "should create upvote" do
     @upvote = Vote.upvote_restaurant(users(:example), restaurants(:one), true)
     assert_equal(true, @upvote.vote)
  end

  #creates a downvote where a false = downvote
   test "should create downvote" do
     @downvote = Vote.upvote_restaurant(users(:example), restaurants(:one), false)
     assert_equal(false, @downvote.vote)
   end
end
