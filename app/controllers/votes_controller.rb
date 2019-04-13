# app/controllers/votes_controller.rb
class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.restaurant = Restaurant.find(params[:restaurant])
    @vote.user = current_user
    if @vote.save
      respond_to do |format|
        format.html { redirect_to restaurants_url, notice: 'Thank you for voting!' }
    else
       format.html { redirect_to restaurants_url, notice: 'You have already voted for that restaurant.' }
      end
    end
  end

  def upvote_restaurant
    Vote.upvote_restaurant(current_user, Restaurant.find(params[:restaurant]), "true")
    redirect_to restaurants_url
  end

  def downvote_restaurant
    Vote.downvote_restaurant(current_user, Restaurant.find(params[:restaurant]), "false")
    redirect_to restaurants_url
  end

  private

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id]) 
    end

    def vote_params
      params.permit(:current_user, Restaurant.find(params[:restaurant]), :vote)
    end
end
