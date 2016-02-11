Rails.application.routes.draw do

  patch '/assign_business', to: 'users#assign_business'
  root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :humans, only: [:index, :show]
  patch '/decomission_human', to: 'humans#decomission_human'

  resources :auctions, only: [:index, :show]
  post '/declare_winner', to: 'auctions#declare_winner'

  resources :bids, only: [:create]

  namespace :admin do
    resources :businesses, only: [:show], path: ':business', as: :business
    resources :users, only: [:update]
  end

  namespace :skynet do
    resources :businesses, only: [:update]
    put '/deactivate', to: 'businesses#deactivate'
    put '/activate', to: 'businesses#activate'
    delete '/decline', to: 'businesses#decline'
    get '/dashboard', to: 'users#show'
  end

  resources :users, only: [:new, :create, :update, :edit]
  get '/dashboard', to: 'users#show'
  get '/live_auctions', to: 'users#live_auctions'

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
