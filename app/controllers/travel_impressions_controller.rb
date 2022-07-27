class TravelImpressionsController < ApplicationController

  def create
    @travel = Travel.find(params[:travel_id])
    @travel_impression = TravelImpression.new(travel_impression_params)
    if @travel_impression.save
      redirect_to "/travels/#{@travel_impression.travel_id}"
    else
      render "travels/show"
    end
  end

  def edit
    @travel = Travel.find(params[:id])
    travel_id = @travel.id
    @travel_impression = TravelImpression.find_by(travel_id: travel_id)
  end

  def update
    @travel = Travel.find(params[:travel_id])
    travel_id = @travel.id
    @travel_impression = TravelImpression.find_by(travel_id: travel_id)
    if @travel_impression.update(travel_impression_params)
      redirect_to travel_path(@travel.id)
    else
      render :edit
    end
  end


  private

  def travel_impression_params
    params.require(:travel_impression).permit(:impression, images:[]).merge(user_id: current_user.id, travel_id: params[:travel_id])
  end
end
