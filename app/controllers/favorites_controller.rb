# app/controllers/favorites_controller.rb
class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /restaurants
  # GET /restaurants.json
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.new(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to restaurants_url, notice: 'Thank you for favoriting!' }
      else
	format.html { redirect_to restaurants_url, notice: 'You already favorited for that restaurant!' }
      end
    end
  end

  #Favorites a restaurant based on userID and restaurantID
  def favorite_restaurant
    Favorite.favorite_restaurant(current_user,Restaurant.find(params[:restaurant]), "true")
    redirect_to restaurants_url
  end
  
  def show
  end

  def edit
  end

  def new
    @favorite = Favorite.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id]) 
    end

    def favorite_params
      params.permit(:restaurant_id, :user_id, :vote)
    end
end
