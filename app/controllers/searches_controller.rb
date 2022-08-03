class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:key_word]).page(params[:page]).per(5).order("id DESC")
    else
      @travels = Travel.looks(params[:search], params[:key_word]).page(params[:page]).per(5).order("id DESC")
    end
  end
end
