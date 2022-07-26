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


  private

  def travel_impression_params
    params.require(:travel_impression).permit(:impression, images:[]).merge(user_id: current_user.id, travel_id: params[:travel_id])
  end
end
