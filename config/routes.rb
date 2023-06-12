Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'dashboard#index'

  root "flats#index"
  resources :flats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :update]
end
