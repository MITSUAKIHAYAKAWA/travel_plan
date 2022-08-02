class FavoritesController < ApplicationController
  def create
    @travel = Travel.find(params[:travel_id])
    favorite = @travel.favorites.new(user_id: current_user.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @travel = Travel.find(params[:travel_id])
    favorite = @travel.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      favorite.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
