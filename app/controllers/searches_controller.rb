class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:key_word])
    else
      @travels = Travel.looks(params[:search], params[:key_word])
    end
  end
end
