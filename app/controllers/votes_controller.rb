# app/controllers/votes_controller.rb
class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.restaurant = Restaurant.find(params[:id])
    if @vote.save
      respond_to do |format|
        format.html { redirect_to @vote.restaurant }
        format.js # we'll use this later for AJAX!
      end
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:user)
    end
end
