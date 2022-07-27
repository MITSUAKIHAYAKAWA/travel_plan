class TravelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @travels = Travel.limit(6).order("id DESC")
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.travel_time_one <= @travel.travel_time_two
      if @travel.save
        redirect_to root_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @travel = Travel.find(params[:id])
    @travel_impression = TravelImpression.new
    travel_id = @travel.id
    @impression = TravelImpression.find_by(travel_id: travel_id)
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    @travel = Travel.find(params[:id])
    if @travel.update(travel_params)
      redirect_to travel_path(@travel.id)
    else
      render :edit
    end
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy
    redirect_to root_path
  end

  private

  def travel_params
    params.require(:travel).permit(:travel_title, :travel_time_one, :travel_time_two, :destination_id, :transportation_id, :image).merge(user_id: current_user.id)
  end

end
