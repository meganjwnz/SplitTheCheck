class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @comments = Comment.all
      @favorites = Favorite.all
    end
end
