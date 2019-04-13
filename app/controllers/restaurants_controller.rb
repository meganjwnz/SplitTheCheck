class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    
    if params[:search_name] && params[:search_address]
      @search_name = params[:search_name]
      @search_address = params[:search_address]
      @restaurants = @restaurants.search_by(@search_name, @search_address)
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # Increments upvotes 
  def upvote
    @upvote = 0
    @restaurant = Restaurant.where(id: params[:id])
    @upvote = @restaurants.score
    redirect_to restaurants_url
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @vote = Vote.new(vote_params)
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end
end
