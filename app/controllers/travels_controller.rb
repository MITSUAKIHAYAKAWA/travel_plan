class TravelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @travels = Travel.limit(12).order('id DESC')
    @tag_list = Tag.all
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    tag_list = params[:travel][:tag_name].split(nil)
    if @travel.travel_time_one <= @travel.travel_time_two
      if @travel.save
        @travel.save_tag(tag_list)
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
    @travel_tags = @travel.tags
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

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @travels = @tag.travels.all
  end

  private

  def travel_params
    params.require(:travel).permit(:travel_title, :travel_time_one, :travel_time_two, :destination_id, :transportation_id,
                                   :image).merge(user_id: current_user.id)
  end
end
