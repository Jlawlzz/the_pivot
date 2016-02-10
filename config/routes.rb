Rails.application.routes.draw do

  root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/declare_winner', to: 'auctions#declare_winner'
  get '/live_auctions', to: 'users#live_auctions'
  patch '/assign_business', to: 'users#assign_business'

  resources :humans, only: [:index, :show]
  patch '/decomission_human', to: 'humans#decomission_human'

  resources :auctions, only: [:index, :show]

  resources :bids, only: [:create]

  namespace :admin do
    resources :businesses, only: [:show], path: ':business', as: :business
  end

  namespace :skynet do
    resources :businesses, only: [:update]
    get '/dashboard', to: 'users#show'
  end

  resources :users, only: [:new, :create, :update, :edit]
  get '/dashboard', to: 'users#show'

  resources :businesses, only: [:new, :create, :index]
  resources :businesses, only: [:show], path: ':business', as: :business
end

# resources :businesses, only: [:new, :create]
# resources :items, only: [:new, :create, :index, :destroy]
# resources :orders, only: [:index]
# resources :reviews, only: [:index]

# resources :cart_items, only: [:create, :update, :destroy]
# resources :reviews, only: [:new, :create, :destroy]

# resources :orders, only: [:create, :index, :show, :update]
# resources :order_items, only: [:create]
# resources :travesties, only: [:show, :index], param: :slug do
# resources :humans, only: [:index]
# end
