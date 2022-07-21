Rails.application.routes.draw do
  devise_for :users
  root to: "travels#index"
  resources :travels, only: [:new, :create]
end
