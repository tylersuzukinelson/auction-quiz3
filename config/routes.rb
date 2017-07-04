Rails.application.routes.draw do

  get '/', to: 'auctions#index', as: 'home'

  resources :sessions, only: [:new, :create] do
   delete :destroy, on: :collection
  end

  resources :auctions do
    resources :bids, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :index, :show] do

  end

end
