class ApplicationController < ActionController::Base
  before_action :congigure_permitted_parameters, if: :devise_controller?

  private

  def congigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end
end
