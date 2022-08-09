class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    super
    if account_update_params[:avatar].present?
      resource.avatar.attach(account_update_params[:avatar])
    end
  end
  
end
