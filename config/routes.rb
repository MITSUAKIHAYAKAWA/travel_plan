Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users, only: :show
  root to: "travels#index"
  resources :travels, only: [:new, :create, :show, :update, :edit, :destroy] do
    resources :travel_impressions, only: [:create, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  get "search" => "searches#search"

  resources :tags do
    get "travels", to: "travels#search"
  end
end
