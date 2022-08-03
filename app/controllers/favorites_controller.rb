class FavoritesController < ApplicationController
  before_action :set_travel_params


  def create
    favorite = @travel.favorites.new(user_id: current_user.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    favorite = @travel.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      favorite.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def set_travel_params
    @travel = Travel.find(params[:travel_id])
  end
  
end
