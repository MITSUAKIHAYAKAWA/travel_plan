class TravelImpressionsController < ApplicationController
  before_action :set_travel_params, only: [:create, :update]
  before_action :set_travel_impression, only: :update


  def create
    @travel_impression = TravelImpression.new(travel_impression_params)
    if @travel_impression.save
      redirect_to "/travels/#{@travel_impression.travel_id}"
    else
      @travel_tags = @travel.tags
      render 'travels/show'
    end
  end

  def edit
    @travel = Travel.find(params[:id])
    travel_id = @travel.id
    @travel_impression = TravelImpression.find_by(travel_id: travel_id)
  end

  def update
    if @travel_impression.update(travel_impression_params)
      redirect_to travel_path(@travel.id)
    else
      render :edit
    end
  end

  private

  def travel_impression_params
    params.require(:travel_impression).permit(:impression, images: []).merge(user_id: current_user.id,
                                                                             travel_id: params[:travel_id])
  end

  def set_travel_params
    @travel = Travel.find(params[:travel_id])
  end

  def set_travel_impression
    @travel_impression = TravelImpression.find_by(travel_id: params[:travel_id])
  end

end
