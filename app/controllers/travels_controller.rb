class TravelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  
  def index
  end

  def new
    @travel = Travel.new
  end

  def create
    binding.pry
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def travel_params
    params.require(:travel).permit(:travel_title, :travel_time_one, :travel_time_two, :destination_id, :transportation_id, :image).merge(user_id: current_user.id)
  end

end
