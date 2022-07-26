Rails.application.routes.draw do
  devise_for :users
  root to: "travels#index"
  resources :travels, only: [:new, :create, :show, :update, :edit, :destroy] do
    resources :travel_impressions, only: :create
  end
end
