Rails.application.routes.draw do

  root 'home#index'

  # get '/cart', to: 'cart_items#show'

  get '/dashboard', to: 'users#show'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/doomsday', to: 'sessions#doomsday'

  # resources :cart_items, only: [:create, :update, :destroy]
  resources :items, only: [:index, :show] do
    # resources :reviews, only: [:new, :create, :destroy]
  end
  # resources :orders, only: [:create, :index, :show, :update]
  # resources :order_items, only: [:create]
  # resources :travesties, only: [:show, :index], param: :slug do
    # resources :items, only: [:index]
  # end

  namespace :admin do
    get '/dashboard', to: 'base#show'
    # resources :items, only: [:new, :create, :index, :destroy]
    # resources :orders, only: [:index]
  end
  # resources :reviews, only: [:index]
  resources :users, only: [:new, :create, :update]
  # resources :businesses, only: [:new, :create]
  resources :businesses, only: [:new, :create]
  resources :businesses, only: [:show, :index]
end
